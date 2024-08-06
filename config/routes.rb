Rails.application.routes.draw do
  # Doctor's show page
  get 'doctors/:id', to: 'doctors#show', as: 'doctor'

  # route to remove a patient from a doctor
  delete 'doctors/:doctor_id/patients/:patient_id', to: 'doctor_patients#destroy', as: 'doctor_patient'

end
