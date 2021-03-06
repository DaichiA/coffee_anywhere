class CommentsController < ApplicationController
  before_action :require_login

  def create
    @review = Review.find(params[:review_id]) # hidden_tag でreview_id仕込む
    @comment = @review.comments.build(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      @review.create_notification_comment!(current_user, @comment.id, @review.user_id)
      respond_to do |format|
        format.html { redirect_back(fallback_location: root_path) }
        format.js
      end
    else
      redirect_back(fallback_location: root_path)
      flash[:danger] = 'コメントを投稿できませんでした'
    end
  end

  def destroy
    @review = Comment.find(params[:id]).review
    Comment.find(params[:id]).destroy
    respond_to do |format|
      format.html { redirect_back(fallback_location: root_path) }
      format.js
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :username)
  end
end
