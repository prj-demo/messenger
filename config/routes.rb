Rails.application.routes.draw do
  mount Avo::Engine, at: Avo.configuration.root_path
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }  
  root 'pages#home'
  resources :channels do
    resources :messages
  end
  get 'user/:id', to: 'users#show', as: 'user'
end
