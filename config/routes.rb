Rails.application.routes.draw do


  #get 'guests/invite'

  #devise_for :users
  devise_for :users, :controllers => { :registrations => "registrations" }

  post "profiles_changestatus" => "profiles#changestatus"

  post "profiles_resetpassword" => "profiles#resetpassword"

  resources :profiles do
    collection { post :import}
  end

  resources :home do
    collection { post :import }
  end


  #root records_path && '?direction=asc&sort=firstname'

  #root 'records#index\?direction=asc&sort=firstname'

  #get "home_short" => "home#short", :via => :post

  #get "home_long" => "home#long", :via => :post

  match 'home/short' => "act#short", :via => :post
  #match 'home_short' => "act#short", :via => :post
#http://localhost:3000/home_short?id=1
  #get 'records/inactive'

  root 'home#index'

  get "orders"=>'home#orders'
  match "long"=>'home#long', :via => :post
  get "long"=>'home#long'
    #get 'events/create'

  #get 'events/destroy'
  #get 'event/show'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
