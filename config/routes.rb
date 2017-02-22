Rails.application.routes.draw do
  devise_for :books
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  root 'home#index'
end
