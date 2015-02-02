Rails.application.routes.draw do

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   root 'home#index'
   match '/about', to: 'static_pages#about', via: 'get'
   match '/contact', to: 'static_pages#contact', via: 'get'
   match '/price', to: 'static_pages#price', via: 'get'
   match '/servis', to: 'static_pages#servis', via: 'get'
   match '/news', to: 'static_pages#news', via: 'get'
   match '/certificate', to: 'static_pages#certificate', via: 'get'
   match '/doctors', to: 'static_pages#doctors', via: 'get'
   match '/laboratory', to: 'static_pages#laboratory', via: 'get'
   match '/administration', to: 'static_pages#administration', via: 'get'
   match '/history', to: 'static_pages#history', via: 'get'
   match '/partners', to: 'static_pages#partners', via: 'get'
   resources :recipes, only: [:index]

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
  unless Rails.application.config.consider_all_requests_local
    get '*not_found', to: 'errors#error_404'
  end
end
