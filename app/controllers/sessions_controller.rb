class SessionsController < ApplicationController
  def new
  end

  def create
    if @user = User.authenticate_with_credentials(params[:email], params[:password])
      session[:user_id] = @user.id
      redirect_to "/"
    else
      flash.now.alert = "Invalid Email or Password"
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to login_path
  end
end