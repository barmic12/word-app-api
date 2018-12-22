Rails.application.routes.draw do

  # devise_scope :user do
  #   post "/login" => "sessions#create"
  #   delete "/logout" => "sessions#destroy"
  #   get "/signup" => "devise/registrations#new", as: "new_user_registration"
  # end
  devise_for :users, controllers: {sessions: 'sessions', registrations: 'registrations'}
  resources :words
  get '/api_version', controller: :application, action: :api_version
end
