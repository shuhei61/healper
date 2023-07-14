Rails.application.routes.draw do
  root to:"calendars#index"
  devise_for :users, controllers: {
    registrations: 'custom_registrations'
  }
  resources :calendars
  resources :foods
  resources :wants
end
