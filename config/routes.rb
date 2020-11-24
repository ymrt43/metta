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
    collection do
      get 'adminuser'
    end
  end
  resources :courses
  resources :reservations, only: [:new, :create]
  
end
