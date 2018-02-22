Rails.application.routes.draw do
  get 'my_notes/index', as: 'my_notes'

  devise_for :users
  root 'pages#home'
  resources :notes do
    resources :comments, only: :create
  end
end
