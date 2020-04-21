class TopicsController < ApplicationController
  def new
    @topic = Topic.new
  end
  
  def create
    @topic = current_user.topic.new(topic_params)
     
     if @topic = save
       redirect_to topic_path, success: '投稿に成功しました'
     else
       flash.now[:dander] = "投稿に失敗しました"
       render :new
     end
  end
  
  private
  def topic_params
    params.require(:topic).permit(:image, :description)
  end
end
