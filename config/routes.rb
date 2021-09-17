Rails.application.routes.draw do
  resources :articles

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'

  scope :active_storage, module: :active_storage, as: :active_storage do
    resources :attachments, only: [:destroy]
  end

  root to: redirect('/articles')
end
