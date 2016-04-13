Rails.application.routes.draw do
  #devise_for :patients
  #devise_for :doctors
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :patients, :path_names => {:sign_up => "sign_up"},:controllers => {:registrations => "patients/registrations"}
  devise_for :doctors, :path_names => {:sign_up => "sign_up"},:controllers => {:registrations => "doctors/registrations"}
  resources :doctors
  resources :patients
  root to: 'visitors#index'
  devise_for :users
  resources :users
  resources :doctor_categories
  resources :time_slots
  get 'cities/', to: 'doctors#cities'
end
