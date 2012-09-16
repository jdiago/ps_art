class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_name(params[:name])
    if user and user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to login_url, alert: "Invalid name/pw!"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end
end