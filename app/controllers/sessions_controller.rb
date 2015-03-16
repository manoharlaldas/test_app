class SessionsController < ApplicationController
  

  # POST /sessions
  # POST /sessions.json

  def create
    user = User.find_by_email(params[:email])
    if user and user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to home_path, notice: 'Logged in successfully.'
    else
      redirect_to login_path, notice: 'Invalid Email or Password.'
    end
  end

 
  # DELETE /sessions/1
  # DELETE /sessions/1.json
  def destroy
    session[:user_id] = nil
    redirect_to login_path, notice: 'Logged Out successfully.'
  end
  
end
