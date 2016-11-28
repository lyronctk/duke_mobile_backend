Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :registrations, only: [:create]
      resources :records
      post '/update_password' => 'users#update_password'
      post '/authenticate' => 'users#authenticate'
    end
  end
end