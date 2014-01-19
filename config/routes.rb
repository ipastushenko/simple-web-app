SimpleWebApp::Application.routes.draw do
  root 'home#index'

  scope :api, format: false, defaults: { format: 'json' } do
    post 'message/create', to: 'message#create'
  end

  devise_for :users
end
