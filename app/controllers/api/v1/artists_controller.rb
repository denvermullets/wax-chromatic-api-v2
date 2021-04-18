module Api
  module V1
    # Artists controller for CRUD
    class ArtistsController < ApplicationController
      def index
        # binding.pry

        render json: { message: 'hey buddy' }
      end

      def find_discogs_artist
        # artists = Artist.
        # binding.pry
        url = ::RestClient::Request.execute(
          method: :get, url: "https://api.discogs.com/database/search?q=#{params[:artist]}&type=artist",
          headers: {
            'Content-Type': 'application/json',
            Accept: 'application/vnd.discogs.v2.plaintext+json',
            Authorization: "Discogs key=#{ENV['DISCOGS_KEY']}, secret=#{ENV['DISCOGS_SECRET']}",
            'User-Agent': 'WaxChromatics/v0.2 +https://waxchromatics.com'
          }
        )

        discogs_response = JSON.parse(url)
        render json: discogs_response
      end
    end
  end
end
