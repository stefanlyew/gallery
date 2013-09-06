Mtsiran::Application.routes.draw do  
  devise_for :admins

  root :to => 'welcome#carousel'
  resources :artworks
  resources :galleries do
  	member { post :sort }
  	collection { post :featuredsort }
  end

end
