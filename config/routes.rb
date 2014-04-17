  EnterpriseCollab::Application.routes.draw do
  
  # devise_scope :user do
    # match "users/sign_in" => "home#index", :via => [:get, :post]
  # end  
  devise_for :users, :controllers => {:registrations => "users/registrations"}
  authenticated :user do
    resources :users
    post "users/new_user_create" => "users#new_user_create"
    # post "/users/update" => "users#update"
  end

  resources :accounts
  # get "/accounts/edit/:id" => "accounts#cron_tasks"
  # get "/accounts/cron_tasks" => "accounts#cron_tasks"

  # resources :users do
  #   member do
  #     get 'add'
  #   end
  # end

  resources :dashboard
  resources :spaces
  get "spaces/milestones/:id/:filter" => "spaces#milestones"

  resources :groups
  resources :standup_reports

  # get "/register" => 'home#register'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'home#index'
  
  # get "users/new_user" => "users#new_user"

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
