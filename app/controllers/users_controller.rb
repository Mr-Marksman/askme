class UsersController < ApplicationController

  before_action :set_user, only: %i[edit show update destroy]
  before_action :authorize_user, only: %i[edit update destroy]

  def new
    session[:current_time] = Time.now
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id

      redirect_to questions_url, notice: "User with nickname #{user_params[:nickname]} successfully created!"
    else
      flash.now[:alert] = "You filled in the registration fields incorrectly"

      render :new
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      session[:user_id] = @user.id

      redirect_to questions_url, notice: "User data has updated"
    else
      flash.now[:alert] = "Errors occurred while trying to update the user"

      render :edit
    end
  end

  def destroy
    nickname = @user.nickname

    @user.destroy
    session.delete(:user_id)

    redirect_to questions_path, notice: "User with nickname #{nickname} has deleted"
  end

  def show
    @question = Question.new(user: @user)
  end

  private

  def authorize_user
    redirect_with_alert if current_user != @user || current_user == nil
  end

  def set_user
    @user = User.find_by!(nickname: params[:nickname])
  end

  def user_params
    user_params = params.require(:user).permit(:name, :nickname, :email, :password, :password_confirmation, :color)
  end
end
