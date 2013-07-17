Railsplate::Application.routes.draw do
  root to: 'home#index'


  resources :patients
  namespace :patients do
    # resources :doctors, :only => [:create]
    get ":id/doctor-signup/:email" => "invites#new", as: :new_doctor
    post ":id/doctor-signup/" => "invites#create", as: :create_doctor
    get ":id/doctor-signin/" => "invites#existing", as: :existing_doctor

    get ":id/doctor/:id" => "doctors#show", as: :doctor
    get ":id/doctors" => "doctors#index", as: :doctors
    post ":id/doctors" => "doctors#invite_doctor", as: :invite_doctor

    get ":id/carers" => "carers#index", as: :carers
  end

  resources :doctors do
  end
  namespace :doctors do
    post ":id/patients" => "patients#invite_patient", as: :invite_patient
    get ":id/patient/:id" => "patients#show", as: :patient
    get ":id/patients" => "patients#index", as: :patients
  end

  resources :sessions

  get "logout" => "sessions#destroy_doctor", :as => "logout_doctor"
  get "logout" => "sessions#destroy_patient", :as => "logout_patient"

  # post '/session' => 'sessions#create'
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
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
