Rails.application.routes.draw do

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#top'
  get 'users/:id/follows' => 'users#follows', as: "users_follows"
  get 'users/:id/followers' => 'users#followers', as: "users_followers"
  get 'users/:id/favoriteslist' => 'users#favorite_list', as: "users_favorites"
  resources :relationships, only: [:create, :destroy]
  resources :users,only: [:show,:edit,:update,:destroy]
  resources :plans do
  	resource :favorites, only: [:create, :destroy]
  	resources :plan_comments, only: [:create, :destroy]
  end
end
