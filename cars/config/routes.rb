Rails.application.routes.draw do
  resources :items
  resources :services
  resources :vehicles
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end