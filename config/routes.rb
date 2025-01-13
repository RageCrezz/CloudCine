Rails.application.routes.draw do
  get "dashboard/index"
  devise_for :users

  # Root paths for authenticated and unauthenticated users
  devise_scope :user do
    authenticated :user do
      root to: "dashboard#index", as: :authenticated_root # Replace 'dashboard#index' with your actual authenticated home
      get "/settings", to: "settings#index", as: :settings
    end

    unauthenticated do
      root to: "devise/sessions#new", as: :unauthenticated_root
    end
  end

  # Setup routes
  get "/setup", to: "setup#index"
  post "/setup", to: "setup#create"
  get "/setup/success", to: "setup#success", as: :setup_success
end
