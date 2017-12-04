Rails.application.routes.draw do

  devise_for :users, :controllers => {:registrations => "user"}

  devise_scope :user do
    get 'user/:id' => 'user#show', as: :user_profile
  end

  root controller: :videos, action: :index



  get "/pages/login" => "users#login", as: :login
  get "/pages/signup" => "users#signup", as: :signup
  get "/pages/:page" => "pages#page", as: :page
  get "/pages/pageindex" => "pages#pageindex", as: :pageindex

  resources :videos
  resources :comedians
  resources :publishers
  resources :categories
  resources :profiles

  # resources :user, only: [:show]

end


