Mtsiran::Application.routes.draw do
  resources :artworks


  resources :albums

  root :to => 'welcome#gallery'
  get '/filter', to: 'welcome#filter'

end
