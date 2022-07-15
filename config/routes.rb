Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  get 'persons/profile', as: 'user_root'

  root 'posts#index'
  
  resources :posts do
    resources :likes, only: [:create, :destroy]
    resources :comments
  end

  #followings
  get '/follows/:id', to: 'follows#show', as: 'follows'
  post '/follow/:id', to: 'follows#create', as: 'follow'
  delete '/unfollow/:id', to: 'follows#destroy', as: 'unfollow'

end
