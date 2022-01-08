Rails.application.routes.draw do
  get 'posts/indew'
  get 'posts/show'
  get 'posts/new'
  get 'posts/edit'
  get 'users/show'
  devise_for :users
  root to: 'homes#top'
  
  resources :users, only: [:show, :edit, :update]
  resources :posts
end
