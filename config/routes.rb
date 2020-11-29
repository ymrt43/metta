Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'profiles', to: 'users/registrations#new_profile'
    post 'profiles', to: 'users/registrations#create_profile'
  end
  resources :users, only: :new
  root to: 'lessons#home'
  resources :lessons do
    resources :reservations, only: [:new, :create]
    collection do
      get 'adminuser'
      get 'search'
    end
  end
  resources :courses
  
end
