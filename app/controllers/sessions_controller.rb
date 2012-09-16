class SessionsController < ApplicationController
  skip_before_filter :authorize
  
  def new
  end

  def create
    user = User.find_by_name(params[:name])
    if user and user.authenticate(params[:password])
      session[:user_id] = user.id
      session[:user_name] = user.name
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
