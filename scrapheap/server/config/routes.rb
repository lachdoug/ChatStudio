Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  mount ActionCable.server => '/cable'

  root to: 'homes#show'

  resource :workshop
  resource :server_data, only: [:show] do
    resources :rooms, module: :server_data, only: [:new, :create ]
    resources :messages, module: :server_data, only: [:new, :create ]
    resource :events, module: :server_data, only: [:show ]
  end
  resources :users, only: [:show]
  resources :client_apps do
    resource :source, module: :client_apps, only: [:edit, :update]
    resource :serve, module: :client_apps, only: [:show]
  end
  resource :home, only: [:show]
  resource :fake_post, only: [:create]
  namespace :api do
    namespace :v0 do
      resources :rooms, only: [:index, :show, :create]
      resources :messages, only: [:show, :create]
      resource :events, only: [:show ]
    end
  end

end
