Rails.application.routes.draw do
  devise_for :users
  root to: 'translations#index'
  post 'translations/translate', as: :translate
  resources :rules
  resources :words
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
