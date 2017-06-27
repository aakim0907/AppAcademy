class CommentsController < ApplicationController
  # def new
  #   render :new
  # end

  def create
    comment = Comment.new(comment_params)
    comment.user_id = current_user.id
    comment.save
    flash[:errors] = comment.errors.full_messages
    redirect_to post_url(comment.post_id)
  end

  def show
    @comment = Comment.find(params[:id])
  end

  # def edit
  #   @comment = Comment.find(params[:id])
  # end
  #

  private

  def comment_params
    params.require(:comment).permit(:content, :post_id, :parent_comment_id)
  end
end
