class UsersController < ApplicationController
  def new
    session[:current_time] = Time.now
    @user = User.new
  end

  def create
    user_params = params.require(:user).permit(:name, :nickname, :email)

    User.create(user_params)

    redirect_to questions_url, notice: "User with nickname #{user_params[:nickname]} successfully created!"
  end
end
