Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }  
  root 'pages#home'
  resources :channels do
    resources :messages
  end
  get 'user/:id', to: 'users#show', as: 'user'
end
