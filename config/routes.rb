Rails.application.routes.draw do
  resources :tables
  resources :order_products
  get '/order_products_of/:id', to: 'order_products#index', as: 'order_products_of'
  resources :orders
  resources :type_products
  resources :ingredients
  resources :products
  resources :total_products
  get '/new_total_product_of/:id', to: 'total_products#new', as: 'new_total_product_of'
  get '/total_products_of/:id', to: 'total_products#index', as: 'total_products_of'
  resources :users, path: '/admin/users'
  #namespace :admin do
  #  resources :users
  #end
  #para usuarios que iniciaron sesión

  authenticated :user do
    root 'welcomes#index'
  end
  #para ususrios que no han iniciado sesión
  unauthenticated :user do
    devise_scope :user do
      root 'welcomes#unregistered', as: :unregistered_root
    end
  end
  #get 'welcomes/index'

  #get 'welcomes/unregistered'

  get 'welcomes/about'

  get 'welcomes/contact'
  #devise_scope :user do
  #  get "/edit" => "devise/registrations#edit", as: "edit_user_registration" # custom path to sign_up/registration
  #end
  devise_for :users

  
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
