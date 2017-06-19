Rails.application.routes.draw do


  resources :documentos
  resources :casos
  resources :comentarios

  resources :kpis

  resources :roles_privilegios
  resources :privilegios
  resources :roles
  resources :usuarios
  resources :menus
  #resources :sessions
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  post "casos/iniciar"
  get "home/index"
  get "home/noticias"
  root :to => "home#index" #Pagina de inicio de la App

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
