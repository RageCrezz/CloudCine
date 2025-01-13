class ApplicationController < ActionController::Base
  before_action :redirect_to_setup_if_no_users

  private

  def redirect_to_setup_if_no_users
    # Skip redirection if:
    # - Users already exist
    # - Current controller is `SetupController`
    # - Current controller is a Devise controller
    return if User.exists? || controller_name == "setup" || devise_controller?

    # Redirect to the setup page
    redirect_to setup_path
  end

  protected

  # Redirect users to their dashboard or authenticated home after sign-in
  def after_sign_in_path_for(resource)
    authenticated_root_path
  end
end
