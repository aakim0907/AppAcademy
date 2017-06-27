class PostsController < ApplicationController
  before_filter :ensure_log_in, except: [:show]
  before_action :require_user_owns_post!, only: [:edit, :update]

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def update
    @post = Post.find(params[:id])

    if @post.update_attributes(post_params)
      redirect_to post_url(@post)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :edit
    end
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to subs_url
    else
      flash.now[:errors] = @post.errors.full_messages
      render :new
    end
  end

  private
  def require_user_owns_post!
    return if current_user.posts.find(params[:id])
    render json: "Forbidden", status: :forbidden
  end

  def post_params
    params.require(:post).permit(:title, :url, :content, sub_ids: [])
  end
end
