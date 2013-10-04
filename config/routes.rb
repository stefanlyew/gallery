Mtsiran::Application.routes.draw do  
  devise_for :admins
  devise_scope :admin do
	  get "sign_in", :to => "devise/sessions#new"
  end

  root :to => 'carousel_items#index'
  resources :carousel_items, except: [:show] do
    collection { post :sort }
  end
  resources :artworks
  resources :galleries do
  	member { post :sort }
  	collection { post :featuredsort }
  end

  match "profile", :to => "welcome#profile"

  match 'dashboard' => 'galleries#index', as: :admin_root
   match 'side' => 'welcome#sidebar'
end
