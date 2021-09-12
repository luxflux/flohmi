Rails.application.routes.draw do
  resources :articles

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'

  root "articles#index"
end
