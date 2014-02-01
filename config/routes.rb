SimpleWebApp::Application.routes.draw do
  root 'home#index'

  devise_for :users, controllers: { sessions: 'sessions' }, skip: [:sessions]

  scope :api, format: false, defaults: { format: 'json' } do
    post 'message/create', to: 'message#create'

    devise_scope :user do
      post 'signin', to: 'sessions#create'
      delete 'signout', to: 'sessions#destroy'
      get 'current_user', to: 'sessions#show_current_user'
    end
  end
end
