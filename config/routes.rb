Mtsiran::Application.routes.draw do  
  devise_for :admins
  devise_scope :admin do
	  get "sign_in", :to => "devise/sessions#new"
  end

  root :to => 'welcome#carousel'
  resources :artworks
  resources :galleries do
  	member { post :sort }
  	collection { post :featuredsort }
  end

  match "profile", :to => "welcome#profile"

  match 'dashboard' => 'galleries#index', as: :admin_root
   match 'side' => 'welcome#sidebar'
end
