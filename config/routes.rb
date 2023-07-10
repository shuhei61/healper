Rails.application.routes.draw do
  root to:"calendars#index"
  devise_for :users
  resources :calendars
end
