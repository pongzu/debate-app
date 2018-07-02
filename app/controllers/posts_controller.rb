class PostsController < ApplicationController

  def show
    @topic = Topic.find_by(id: params[:id])
    @posts = Post.where(topic_id: @topic.id)
  end


  def create
    @post = Post.new(content: params[:content], topic_id: params[:id])
    @post.save
    @topic = Topic.find_by(id: params[:id])
    redirect_to("/posts/#{@topic.id}")
  end

end
