# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :artists, only: :index do
        get :albums, on: :member
      end

      # Member actions cannot be used outside resource scope.
      resources :albums, except: %i[index show new edit create destroy update] do
        get :songs, on: :member
      end

      scope :genres do
        get '/:genre_name/random_song', to: 'genres#random_song'
      end
    end
  end
end
