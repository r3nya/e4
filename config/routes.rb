E4::Application.routes.draw do
  devise_for :users

  # Administrative interface
  resources :admin, :only => ['index']
  namespace :admin do
    resources :menulinks
    resources :personalisation, :only => ['index', 'edit', 'update']
    resources :pages, :as => :static_pages
    resources :forum, :only => ['index']
    namespace :forum do
      resources :metaforums do
        resources :forums
        match 'forums/:id/newsforum/toggle' => 'forums#toggle_nf', :as => :toggle_newsforum
      end
    end
  end

  # Forum
  resources :forum, :only => ['index', 'show']
  resources :forum do
    resources :posts, :path => '', :only => ['show', 'destroy']
    resources :posts, :path => 'p', :only => ['new', 'create']
  end

  # Lenta
  resources :news, :only => ['index']

  # Comments
  resources :comments

  # Tracker

  resources :tracker, :only => ['index']

  # Static pages
  # Should be last in routes, because handles ANY url
  match '*uri' => 'static_pages#markdown'

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  if ActiveRecord::Base.connection.table_exists? 'personalisations'
    if Personalisation.exists?(5)
      root :to => Personalisation.find(5).data
    else
      root :to => 'static_pages#stub'
    end
  else
    root :to => 'static_pages#stub'
  end

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
