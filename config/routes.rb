Rails.application.routes.draw do
  devise_for :users, path: '/profile'
  root 'static_pages#index'
  resource :users, path: '/profile'
end
