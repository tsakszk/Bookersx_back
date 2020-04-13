Rails.application.routes.draw do
  devise_for :users
  root to: "homes#index"
  resources :users
  resources :books
  get 'home/about' => 'homes#about', as: 'about'
  get 'home/index' => 'homes#index'
end

