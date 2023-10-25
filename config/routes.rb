Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check
  get '/patients/:patient_id/recommendations', to: 'recommendations#index'
  post '/consultation_requests', to: 'consultation_requests#create'
  post '/consultation_requests/:request_id/recommendations', to: 'recommendations#create'
end
