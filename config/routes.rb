Rails.application.routes.draw do

  ## RailsAdmin Route
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  ## Devise Routes
  devise_for :patients, :path_names => {:sign_up => "sign_up"},:controllers => {:registrations => "patients/registrations"}
  devise_for :doctors, :path_names => {:sign_up => "sign_up"},:controllers => {:registrations => "doctors/registrations"}
  devise_for :users

  ## App Resources
  resources :doctors
  resources :patients
  resources :users
  resources :doctor_categories
  resources :time_slots
  resources :appointments

  ## Mapped Routes
  get 'cities/', to: 'doctors#cities'


  ## Root Path
  root to: 'visitors#index'
end
