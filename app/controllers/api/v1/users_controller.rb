module Api
  module V1
    # Users controller, handles user creation and login
    class UsersController < ApplicationController
      skip_before_action :authorized, only: [:create]
      before_action :authorized, only: [:auto_login]

      def create
        @user = User.create(user_params)
        if @user.save
          token = encode_token(user_id: @user.id)
          render json: { user: @user, token: token }
        else
          render json: { error: 'Error creating user' }
        end
      end

      # rubocop:disable Style/SafeNavigation
      def login
        @user = User.find_by(email: user_login_params[:email])

        if @user && @user.authenticate(user_login_params[:password])
          token = encode_token({ user_id: @user.id })
          render json: { user: @user, token: token }
        else
          render json: { error: 'Invalid username or password' }
        end
      end
      # rubocop:enable Style/SafeNavigation

      def auto_login
        render json: @user
      end

      private

      def user_params
        params.require(:user).permit(
          :email, :name, :password, :wax_username, :discogs_user, :oauth_token, :oauth_token_secret
        )
      end

      def user_login_params
        params.require(:user).permit(:email, :password)
      end
    end
  end
end
