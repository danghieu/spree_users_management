Spree::Core::Engine.routes.draw do
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

	end
  # Add your extension routes here
end
