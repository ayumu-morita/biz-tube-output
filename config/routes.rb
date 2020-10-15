Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }
  root to: 'posts#index'
  resources :posts do
    resources :comments, only: [:create,:destroy]
    collection do
      get 'search'
    end
  end
  resources :users, only: :show
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
end
