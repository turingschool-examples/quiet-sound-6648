Rails.application.routes.draw do
  resources :doctors do
    resources :doctor_patients, only: [:destroy], param: :patient_id
  end
  resources :patients, only:[:index]
end