class CommentsController < ApplicationController

  def create
    @comment = Comment.create(comment_params)
    redirect_to dinner_path(params[:comment][:dinner_id])
  end

  def destroy
    @comment = Comment.find(params[:id])
    @dinner = Dinner.find(@comment.dinner_id)
    @comment.destroy
    redirect_to dinner_path(@dinner)
  end

  private

  def comment_params
    params.require(:comment).permit(:dinner_id, :user_id, :content)
  end
end
