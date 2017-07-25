Rails.application.routes.draw do
  resources :publicaciones
  resources :proyectos
  resources :kpis
  resources :roles_privilegios
  resources :privilegios
  resources :roles
  resources :usuarios
  #resources :menus
  #resources :sessions
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  # Vistas del menu general, no necesita login
  get "home/index"
  get "home/noticias"
  get "home/nosotros"
  get "home/proyectos"

  #Menus segun el usuario que haga login
  get "menus/menu_principal"
  get "menus/menu_ind"
  get "menus/menu_min"
  get "/menus/menu_consultor_lid"
  get "/menus/menus/menu_consultor"
  get "/menus/menus/menu_cliente"

  root :to => "home#index" #Pagina de inicio de la App
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
