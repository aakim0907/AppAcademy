class UsersController < ApplicationController
  def index
    @users = User.all
    render json: @users
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: user
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    @user = selected_user
    if @user
      render json: @user
    else
      render json: ["Could not find user"], status: 404 # not found
    end
  end

  def update
    @user = selected_user
    if @user.update_attributes(user_params)
      render json: @user
    else
      render json: @user.errors.full_messages, status: :unprocessable_entity
    end

  end

  def destroy
    @user = selected_user
    if @user
      @user.destroy
      render json: @user
    else
      render json: ["You can't delete me"], status: 404 # not found
    end
  end

  private
  def user_params
    params.require(:user).permit(:username)
  end

  def selected_user
    User.find_by(id: params[:id])
  end
end
