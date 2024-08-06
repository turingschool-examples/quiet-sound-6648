Rails.application.routes.draw do
  # Doctor's show page
  get 'doctors/:id', to: 'doctors#show', as: 'doctor'
end
