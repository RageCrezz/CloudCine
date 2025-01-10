class ApplicationController < ActionController::Base
  before_action :redirect_to_setup_if_no_users
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def redirect_to_setup_if_no_users
    # Redirect to setup page if no users exist and it's not the setup controller
    if User.count.zero? && controller_name != "setup"
      redirect_to setup_path
    end
  end

  protected

  def configure_permitted_parameters
    # Allow additional parameters for Devise
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :security_question_1, :security_answer_1, :security_question_2, :security_answer_2])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :security_question_1, :security_answer_1, :security_question_2, :security_answer_2])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:username])
  end
end
