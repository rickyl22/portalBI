Rails.application.routes.draw do
  resources :recargas_terminals
  resources :recargas
  resources :pronostico_recargas
  resources :pronostico_alta
  resources :altas_plans
  resources :alta
  resources :activaciones
  resources :publicaciones
  resources :proyectos
  resources :estadisticas
  resources :historials
  resources :documentos
  resources :casos
  resources :comentarios
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
  get "/menu/menu_consultor_lid"
  get "menus/menu_consultor"
  get "menus/menu_cliente"
  get "menus/menu_cliente_kpi"

  root :to => "home#index" #Pagina de inicio de la App

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
