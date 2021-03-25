Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :artist_releases
      resources :releases
      resources :label_albums
      resources :labels
      resources :album_genres
      resources :genres
      resources :wantlist_albums
      resources :collection_albums
      resources :member_artists
      resources :artist_albums
      resources :artist_songs
      resources :album_songs
      resources :members
      resources :artists
      resources :songs
      resources :albums
      resources :wantlists
      resources :collections

      resource :users, only: [:create]
      post '/login', to: 'users#login'
      get '/auto_login', to: 'users#auto_login'
    end
  end
end
