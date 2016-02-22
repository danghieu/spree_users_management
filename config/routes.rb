Spree::Core::Engine.routes.draw do
  resources :comments
	namespace :admin do
  		resources :email_subscriptions do 
  			member do
		    	post 'active'
		    end
  		end
  		resources :users do 
  			member do
		    	post 'active'
		    end
  		end
      resources :comments
	end
  # Add your extension routes here
end
