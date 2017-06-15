Rails.application.routes.draw do

  get 'dashboard/users', to: 'users#index', as: 'users'

  get 'dashboard/users/add', to: 'users#new', as: '/users/add'
  post 'dashboard/users', to: 'users#create'

  get 'dashboard/users/:id/edit', to: 'users#edit', as: '/users/edit'
  patch 'dashboard/users/:id', to: 'users#update'
  put 'dashboard/users/:id', to: 'users#update'
  #
  delete 'dashboard/users/:id', to: 'users#destroy', as: '/user'
  get 'dashboard/users/:id/profile', to: 'users#show', as:'/users/profile'
  # resources :users, only: [:new, :create]

  # get 'cafe/index'
  root 'cafe#index'

  get 'cafe/about'

  get 'dashboard', to: "dashboard#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
