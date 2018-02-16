Rails.application.routes.draw do

  get 'users/show'

  get 'carts/index'

devise_for :admins, controllers: {
        registrations: 'admins/registrations',
        sessions: 'admins/sessions'
      }
  # devise_for :admins
  devise_for :users,controllers: {
        sessions: 'users/sessions',
        registrations: 'users/registrations',
        passwords: 'users/passwords'
      }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.
  get "/users/show" => "users#show",as: :users
  delete "/users/destroy" =>"users#destroy"

  resources :items,only: [:new, :create, :index, :show, :update, :edit, :destroy]
  resources :carts
  resources :histroies
  resources :history_addresses
  resources :categories,only: [:new, :create, :index, :update, :edit, :destroy]
  resources :brands,only: [:new, :create, :index, :update, :edit, :destroy]
  resources :sizes,only: [:new, :create, :index, :update, :edit, :destroy]

  get "/admin_users/edit/:id" => "admin_users#edit", as: :edit_adminusers_to_users
  post "/admin_users/:id" => "admin_users#update", as: :adminusers_to_users
  root "items#index"
end
