Rails.application.routes.draw do
  devise_for :users

  # Devise routes for handling custom mappings
  devise_scope :user do
    root to: "devise/sessions#new" # Use Devise's sessions controller for the root path
  end

  # Setup routes
  get "/setup", to: "setup#index"
  post "/setup", to: "setup#create"
end
