class UsersController < ApplicationController
  def new
    render :new
  end

  def create
    user = User.new(user_params)
    if user.save
      log_in_user!(user)
      redirect_to #index page
    else
      flash.now[:errors] = user.errors.full_messages
      redirect_to new_user_url
    end
  end

  private

  def user_params
    params.require(:users).permit(:email, :password)
  end
end
