BravuraPages::Engine.routes.draw do
  resources :palos
  resources :static_pages
  root "static_pages#index"
end
