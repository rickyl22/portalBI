Rails.application.routes.draw do
  resources :casos
  resources :users
  resources :comentarios
  resources :menus
  resources :sessions
  resources :test
  
  get "home/index"
  get "home/noticias"
  root :to => "home#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
