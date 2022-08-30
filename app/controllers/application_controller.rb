class ApplicationController < ActionController::Base
<<<<<<< HEAD
  helper_method :current_user

  private

  def current_user
  	@current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def redirect_with_alert
    redirect_to questions_path, alert: "Hey, you can't be here!"
  end
=======
>>>>>>> 4ac2bd659353386c0a3544f6164712a829b188b2
end
