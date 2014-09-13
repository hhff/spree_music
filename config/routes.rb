Spree::Core::Engine.routes.draw do
  namespace :admin do

    require 'sidekiq/web'
    mount Sidekiq::Web => '/sidekiq'

    resources :products do
      resources :tracks do
        collection do
          post :update_positions
        end
      end
    end
  end
end
