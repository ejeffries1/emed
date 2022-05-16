Rails.application.routes.draw do
  devise_for :patients
  resources :patients
  devise_for :doctors, controllers: {
    registrations: 'doctors/registrations',
    sessions: 'doctors/sessions'
  }
  resources :doctors, only: [:show]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
   root to: "welcome#home"
end
