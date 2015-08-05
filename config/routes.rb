Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'
  root 'index#welcome'

  get 'admin' => 'index#admin'
  get 'users/login' => 'users#login'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products
  resources :users
  resources :movies do
    resources :reviews
  end

  resources :reviews do
    resources :comments, only: [:create]
  end

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  get '/all' => 'index#alphabetical'
  get '/popular_movies' => 'index#popular_movies'
  get '/popular_reviews' => 'index#popular_reviews'
  get '/recent_reviews' => 'index#recent_reviews'


  resources :comments do
    member do
      put 'flag', to: 'comments#flag'
      put 'clear-flag', to: 'comments#clear_flag'
      put 'hide', to: 'comments#hide'
    end
  end

  resources :nested_comments do
    member do
      put 'flag', to: 'nested_comments#flag'
      put 'clear-flag', to: 'nested_comments#clear_flag'
      put 'hide', to: 'nested_comments#hide'
    end
  end

  resources :reviews do
    member do
      put 'like', to: 'reviews#upvote'
      put 'flag', to: 'reviews#flag'
      put 'clear-flag', to: 'reviews#clear_flag'
      put 'hide', to: 'reviews#hide'
    end
  end


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
