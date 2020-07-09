class CommentsController < ApplicationController
  def create
    @review = Review.find(params[:review_id])
    @comment = Comment.new(comment_params)
    if helpers.logged_in
      @comment.save
      redirect_to review_path(@review)
    else
      redirect_to root_path
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :user_id, :review_id)
  end
end
