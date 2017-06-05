Rails.application.routes.draw do
  resources :usuarios
  resources :menus
  resources :sessions
  get "home/index"
  get "home/noticias"
  root :to => "home#index" #Pagina de inicio de la App
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
