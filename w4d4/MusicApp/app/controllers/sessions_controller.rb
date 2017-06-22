class SessionsController < ApplicationController
  def new
    render :new
  end

  def create
    user = find_by_credentials(params[:user][:email], params[:user][:password])
    if user
      user.reset_session_token!
      session[:session_token] = user.session_token
      redirect_to #index page
    else
      flash.now[:errors] = ["Invalid username or password"]
      render :new
    end
  end

  def destroy
    current_user.reset_session_token!
    session[:session_token] = nil
  end
end
