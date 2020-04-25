class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end
  
  def create
    topic = Topic.find_by(params[:topic_id])
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    
    if @comment.save
      redirect_to topics_path, success: 'コメントを投稿しました'
    else
      flash.now[:danger] = 'コメントの投稿に失敗しました'
    end
    
    private
    def comment_params
      params.require(:comment).permit(:content)
    end
  end
end
