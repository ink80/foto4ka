Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users

  root 'posts#index'
  
  resources :posts do
    resources :comments
  end
end
