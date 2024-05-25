Rails.application.routes.draw do

  # devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root :to => "home#index"
  resources :visitors

  namespace :admin do
    resources :bills
    resources :announcements
    resources :estates

    root to: "estates#index"
  end



  # resources :users, only: [:index,:show, :edit, :update]
  devise_for :users, controllers: { registrations: 'users/registrations' ,
  sessions: 'users/sessions'
}
resources :users, module: 'users'
  # devise_for :users


  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
