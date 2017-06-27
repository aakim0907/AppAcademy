class SubsController < ApplicationController
  before_filter :ensure_log_in, except: [:index, :show]
  before_action :require_user_owns_sub!, only: [:edit, :update]

  def index
    @subs = Sub.all
  end

  def show
    @sub = Sub.find(params[:id])
  end

  def edit
    @sub = Sub.find(params[:id])
  end

  def new
    @sub= Sub.new
  end

  def update
    @sub = Sub.find(params[:id])
    if @sub.update_attributes(sub_params)
      redirect_to sub_url(@sub)
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :edit
    end
  end

  def create
    @sub = Sub.new(sub_params)
    @sub.user_id = current_user.id
    if @sub.save
      redirect_to sub_url(@sub)
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :new
    end
  end

  private
  def require_user_owns_sub!
    return if current_user.subs.find(params[:id])
    render json: "Forbidden", status: :forbidden
  end

  def sub_params
    params.require(:sub).permit(:title, :description)
  end

end
