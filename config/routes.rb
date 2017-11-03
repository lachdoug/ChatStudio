Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  mount ActionCable.server => '/cable'

  root to: 'homes#show'

  # resource :workshop
  # resource :server_data, only: [:show] do
  # end
  resource :home, only: [:show]
  resources :users, only: [:show] do
    resource :regenerate_api_token, module: :users, only: [:new, :create]
  end
  resources :client_apps do
    resource :source, module: :client_apps, only: [:show, :edit, :update]
    resource :fork, module: :client_apps, only: [:new, :create]
    resource :serve, module: :client_apps, only: [:show]
    post :reorder, on: :collection
  end
  resources :servers, only: [:index]
  namespace :servers do
    namespace :chat_studio do
      resource :home, only: [ :show ]
      resources :rooms, only: [ :new, :create ]
      resources :messages, only: [ :new, :create ]
      resource :events, only: [ :show ]
      namespace :api do
        namespace :v0 do
          resource :user, only: [ :show ]
          resources :rooms, only: [:index, :show, :create]
          resources :messages, only: [ :show, :create ]
          resource :events, only: [ :show ]
        end
      end
    end
  end
  resource :fake_post, only: [ :create ]

end
