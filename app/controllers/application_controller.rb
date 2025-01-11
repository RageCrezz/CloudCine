class ApplicationController < ActionController::Base
  before_action :redirect_to_setup_if_no_users

  private

  def redirect_to_setup_if_no_users
    redirect_to setup_path if User.count.zero? && controller_name != "setup"
  end
end
