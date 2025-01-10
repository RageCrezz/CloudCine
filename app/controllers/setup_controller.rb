class SetupController < ApplicationController
  def new
    redirect_to root_path if User.exists?
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.admin = true # Mark the first user as an admin
    if @user.save
      redirect_to root_path, notice: "Admin account created successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation, :security_question_1, :security_answer_1, :security_question_2, :security_answer_2)
  end
end
