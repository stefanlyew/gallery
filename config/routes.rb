Mtsiran::Application.routes.draw do  
  root :to => 'welcome#gallery'
  resources :artworks
  resources :galleries

end
