Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
    get 'creditcards', to: 'users/registrations#new_credit_card'
    post 'creditcards', to: 'users/registrations#create_credit_card'
  end
  root 'tests#index'
  resources :users, only: [:show]
  resources :items
end
