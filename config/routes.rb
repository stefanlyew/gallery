Mtsiran::Application.routes.draw do
  resources :artworks


  resources :albums

  root :to => 'welcome#index'

end
