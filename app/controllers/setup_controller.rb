class SetupController < ApplicationController
  require Rails.root.join("config", "initializers", "security_questions.rb")

  def index
    redirect_to root_path if User.exists?

    @questions = SECURITY_QUESTIONS
  end

  def create
    user = User.new(user_params)
    if user.save
      redirect_to setup_success_path, notice: "Admin user created successfully."
    else
      flash.now[:alert] = user.errors.full_messages.join(", ")
      render :index
    end
  end

  def success
    redirect_to root_path if User.count.zero?
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :security_question_1, :security_answer_1, :security_question_2, :security_answer_2)
  end
end
