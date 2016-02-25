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
          get 'new_addresses'
		    end
  		end
      resources :comments do 
        collection do
          put 'update_status'
        end
      end
      
      concern :comments_concern do
      resources :comments
    end

    resources :products, concerns: :comments_concern
    resources :users, concerns: :comments_concern
	end
  post '/admin/users/delete_address' => "/spree/admin/users#delete_address"
  # Add your extension routes here
end
