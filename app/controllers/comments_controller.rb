class CommentsController < ApplicationController
  def new
    @topic = Topic.find(params[:topic_id])
    @comment = @topic.comments.new
  end
  
  def create
    comment = Comment.create(create_params)

    if comment.persisted?
      redirect_to topics_path, success: 'コメントの投稿に成功しました'
    else
      redirect_to new_topic_comment_path, danger: 'コメントの投稿に失敗しました'
    end
  end

  private
  def create_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, topic_id: params[:topic_id])
  end
end
