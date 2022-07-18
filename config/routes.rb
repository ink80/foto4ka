Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :user, skip: [], path: '', controllers: { registrations: 'registrations'}
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

  #followings
  get '/follows/:id', to: 'follows#show', as: 'follows'
  post '/follow/:id', to: 'follows#create', as: 'follow'
  delete '/unfollow/:id', to: 'follows#destroy', as: 'unfollow'

end
