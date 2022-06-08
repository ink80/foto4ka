Rails.application.routes.draw do
  devise_for :users

  root 'posts#index'

  resources :posts

  get 'persons/profile', as: 'user_root'
end
