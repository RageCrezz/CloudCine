Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    root to: "devise/sessions#new"
  end

  get "/setup", to: "setup#new", as: :setup
  post "/setup", to: "setup#create"

  get "home/index"
  get "up" => "rails/health#show", :as => :rails_health_check
end
