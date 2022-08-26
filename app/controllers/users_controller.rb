class UsersController < ApplicationController
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
    @user=User.find(params[:id])
  end

  def update
    @user=User.find(params[:id])

    if @user.update(user_params)
      session[:user_id] = @user.id

      redirect_to questions_url, notice: "User data has updated"
    else
      flash.now[:alert] = "Errors occurred while trying to update the user"

      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])

    nickname = @user.nickname

    @user.destroy
    session.delete(:user_id)

    redirect_to questions_path, notice: "User with nickname #{nickname} has deleted"
  end

  private

  def user_params
    user_params = params.require(:user).permit(:name, :nickname, :email, :password, :password_confirmation, :color)
  end
end
