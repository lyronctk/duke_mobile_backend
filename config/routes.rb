Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :registrations, only: [:create]
      resources :records
      get '/filter_records' => 'records#filter_records'
      post '/update_password' => 'users#update_password'
    end
  end
end
