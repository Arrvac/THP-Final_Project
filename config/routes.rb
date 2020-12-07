Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :admins, path: 'admins', controllers: {
    registrations: 'admins/registrations',
    sessions: 'admins/sessions',
  }

  devise_for :users, path: 'profile', controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
  }
  resource :users, path: 'profile'

  resources :orders
  resources :items, path: 'product'
  resources :item_carts
  resources :charges

  get '/contact', to: 'static_pages#contact'
  get '/about', to: 'static_pages#about'
  get '/informations', to: 'static_pages#info'
  get '/galerie', to: 'static_pages#galerie'
  resource :carts
  get '/accueil', to: 'static_pages#index'
  get '/abonnements', to: 'items#index'
  post '/item_carts/:id', to: 'item_carts#create', as: 'panier'

  scope '/checkout' do 
    post 'create', to: 'checkout#create', as: 'checkout_create'
    get 'cancel', to: 'checkout#cancel', as: 'checkout_cancel'
    get 'success', to: 'checkout#success', as: 'checkout_success'
  end

  root 'static_pages#index'
end
