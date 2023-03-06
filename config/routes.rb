Rails.application.routes.draw do
  resources :lessees
  resources :bikes
  
  namespace :api do
    namespace :v1 do
      post "/admins/login", to: "admins#login"
      post "/dealers/login", to: "dealers#login"
      resources :dealers
      resources :bikes
      resources :lessees
      resources :admins
      # post "/dealers", to: "dealers#create"
    end

  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
