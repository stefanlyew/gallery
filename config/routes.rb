Mtsiran::Application.routes.draw do  
  devise_for :admins
  devise_scope :admin do
	  get "sign_in", :to => "devise/sessions#new"
  end

  root :to => 'carousel_items#index'
  resources :profiles, only: [:show, :edit, :update]
  resources :carousel_items, except: [:show] do
    collection { post :sort }
  end
  resources :artworks do
    collection do
      get :edit_multiple
      put :update_multiple
    end
  end
  resources :galleries do
  	member { post :sort }
  	collection { post :featuredsort }
    collection { post :archivedsort }
    collection { get :archive }
  end


  match 'dashboard' => 'galleries#index', as: :admin_root
   match 'side' => 'welcome#sidebar'
end
