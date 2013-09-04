Mtsiran::Application.routes.draw do  
  root :to => 'welcome#gallery'
  resources :artworks
  resources :galleries do
  	member { post :sort }
  end

end
