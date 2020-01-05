Rails.application.routes.draw do
  root to: 'home#index'
  get '/sample_images',   to: 'home#index'
  get '/about_the_order', to: 'home#index'
  get '/sample_images/:id/order', to: 'home#index'
  get '/payment/:order_number', to: 'home#index'
  get '/payment/:order_number/success/', to: 'home#index'
  get '/not_found/:order_number', to: 'home#index'
  get '/contact', to: 'home#index'

  namespace :api, format: 'json' do
    resources :sample_images
    resources :orders, param: :order_number
    resources :payments
    post 'square_payment', to: 'square_payment#charge_card'
  end
  
end
