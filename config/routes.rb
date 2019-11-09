Rails.application.routes.draw do
  root to: 'home#index'

  namespace :api, format: 'json' do
    resources :sample_images, only: :index
  end
  
end
