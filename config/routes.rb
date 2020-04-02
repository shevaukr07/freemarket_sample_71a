Rails.application.routes.draw do
  # get 'categorys/new'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :categorys, only: [:new,:show,:index]

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
    get 'creditcards', to: 'users/registrations#new_creditcard'
    post 'creditcards', to: 'users/registrations#create_creditcard'
    get 'profile_edit', to: 'users/registrations#profile_edit'
    patch 'profile_update', to: 'users/registrations#profile_update'
  end
  root 'tests#index'
  resources :tests, only: [:index, :new] do
    collection do
      get 'test'
      get 'bought'
      get 'sold'
    end
  end
  resources :users, only: [:show,:destroy]

  resources :items do
    resources :comments, only: :create
    collection do
      post 'purchase'
      get 'search'
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
      
    end
  end


  namespace :item do
    resources :secound, only: [:index ,:show] do
      member do
        get 'sold'
      end
    end
  end


  resources :card, only: [:new, :show] do
    collection do
      post 'show', to: 'card#show'
      post 'pay', to: 'card#pay'
      post 'delete', to: 'card#delete'
    end
  end

  resources :purchase, only: [:index] do
    member do
      post 'index', to: 'purchase#index'
      post 'pay', to: 'purchase#pay'
      get 'done', to: 'purchase#done'
    end
  end
  # get 'items/purchase' :to 'items#purchase'



  resources :addresses, only: [:edit, :update]

end

