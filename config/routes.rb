Rails.application.routes.draw do
  devise_for :patients, controllers: {
    registrations: 'patients/registrations',
    sessions: 'patients/sessions'
  }
 
    resources :patients, only: [:index, :show] do 
      resources :prescriptions, only: [:show, :index, :new, :edit]
    end

  resources :prescriptions, only: [:index, :new, :create, :edit, :show]
  devise_for :doctors, controllers: {
    registrations: 'doctors/registrations',
    sessions: 'doctors/sessions'
  }
  resources :doctors, only: [:show]

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  #get '/patients/:patient_id/prescriptions/new', to: 'prescriptions#new'
  # Defines the root path route ("/")
   root "welcome#home"
end
