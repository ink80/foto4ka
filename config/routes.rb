Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  get 'persons/profile', as: 'user_root'

  root 'posts#index'
  
  #profile
  get '/view/:id', to: 'profile#show', as: 'view_profile'
  get '/profile/edit', to: 'profile#edit'
  patch '/profile/update', to: 'profile#update'
  get '/view_all', to: 'profile#show_all'

  resources :posts do
    resources :likes, only: [:create, :destroy]
    resources :comments
  end
end
