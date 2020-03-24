Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
    get 'creditcards', to: 'users/registrations#new_creditcard'
    post 'creditcards', to: 'users/registrations#create_creditcard'
  end
  root 'tests#index'
  resources :tests, only: [:index, :new]
  resources :users, only: [:show]
  resources :items do
    collection do
      post 'purchase'
    end
  end
  resources :cards
  
  # get 'items/purchase' :to 'items#purchase'

    
end
