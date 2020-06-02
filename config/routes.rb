# frozen_string_literal: true

Rails.application.routes.draw do
  # login
  # get    '/login',   to: 'sessions#new'
  # post   '/login',   to: 'sessions#create'
  # delete '/logout',  to: 'sessions#destroy'

  #/users/auth/divise
  devise_for :users, controllers: {
      omniauth_callbacks: "users/omniauth_callbacks"
  }
  root to: 'home#index'
  get '/sample_images',   to: 'home#index'
  get '/about_the_order', to: 'home#index'
  get '/sample_images/:id/order', to: 'home#index'
  get '/sample_images/new', to: 'home#index'
  get '/sample_images/:id', to: 'home#index'
  get '/payment/:order_number', to: 'home#index'
  get '/payment/:order_number/success/', to: 'home#index'
  get '/not_found/:order_number', to: 'home#index'
  get '/news/', to: 'home#index'
  get '/contact', to: 'home#index'
  get '/register', to: 'home#index'
  get '/login', to: 'home#index'

  namespace :api, format: 'json' do
    resources :sample_images
    resources :orders, param: :order_number
    resources :payments
    resources :news
    resources :users
    get 'login', to: 'sessions#create'
    post 'square_payment', to: 'square_payment#charge_card'
    post 'line_order_to_user', to: 'line#order_create_to_user'
    post 'line_payment_to_user ', to: 'line#payment_success_to_user'
  end
end
