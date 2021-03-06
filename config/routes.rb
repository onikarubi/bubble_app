Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  resources :users, only: %i[show update edit]

  devise_scope :user do
    root to: 'articles#index'
  end

  resources :articles do
    resource :favorites, only: %i[create destroy]
    resources :comments, only: %i[create destroy edit update]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
