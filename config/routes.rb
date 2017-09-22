Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root controller: :videos, action: :index

  get "/pages/login" => "users#login", as: :login
  get "/pages/signup" => "users#signup", as: :signup
  get "/pages/:page" => "pages#page", as: :page
  get "/pages/pageindex" => "pages#pageindex", as: :pageindex

  resources :videos
  resources :comedians
  resources :publishers
  resources :categories
end

