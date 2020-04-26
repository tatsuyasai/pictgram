class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end
  
  def create
    @comment = Comment.new(content_params)
    @comment.user_id = current_user.id
    
    if @comment.save
      redirect_to topics_path, success: 'コメントを投稿しました'
    else
      flash.now[:danger] = 'コメントの投稿に失敗しました'
      render :new
    end
  end
    
    private
    def content_params
      params.require(:comment).permit(:content, :topic_id)
    end
end
