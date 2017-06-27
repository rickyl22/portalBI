Rails.application.routes.draw do
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
  get "home/index"
  get "home/noticias"
  get "home/nosotros"
  get "home/proyectos"
  root :to => "home#index" #Pagina de inicio de la App
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
