Rails.application.routes.draw do
  root to:"calendars#index"
  devise_for :users, controllers: {
    registrations: 'custom_registrations'
  }
  resources :calendars do
    resources :calendar_foods, only:[:destroy]
    resources :calendar_pre_foods, only:[:destroy]
  end
  resources :foods
  resources :wants
  
end
