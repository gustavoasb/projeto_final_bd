Rails.application.routes.draw do
  resources :users
  resources :units
  resources :ufs
  resources :telephones
  resources :symptoms
  resources :specializations
  resources :notifications
  resources :hospitals
  resources :health_conditions
  resources :entry_has_symptoms
  resources :entries
  resources :doctors
  resources :doctor_has_specializations
  resources :districts
  resources :cities
  resources :attendants
  resources :addresses
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
