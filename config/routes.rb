Rails.application.routes.draw do
  root 'home#index'

  devise_for :users

  resources :posts, only: :show

  namespace :admin do
    resources :posts
    resources :users, only: %i[index new create destroy]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
