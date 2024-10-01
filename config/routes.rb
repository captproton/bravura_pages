BravuraPages::Engine.routes.draw do
  resources :palos
  root 'palos#index'
end
