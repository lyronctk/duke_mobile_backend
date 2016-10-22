Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :registrations, only: [:create]
      resources :records
      # post '/records' => 'records#create'
      # patch '/records' => 'records#update'
      # delete '/records' => 'records#destroy'
      post '/update_password' => 'users#update_password'
    end
  end
end
