class PostsController < ApplicationController

  def show
    @topic = Topic.find_by(id: params[:id])
    @posts = Post.where(topic_id: @topic.id).order(created_at: :desc)
    @position = Position.find_by(topic_id: @topic.id, user_id: @current_user.id)
      if @position.position == "blue" 
       flash[:notice] ="🔥you are going to discuss with blue opinion🔥"
      else
       flash[:notice] ="🔥you are going to discuss with red opinion🔥"
      end
  end




  def create
    @post = Post.new(content: params[:content], topic_id: params[:id], users_id: @current_user.id)
    @topic = Topic.find_by(id: params[:id])
    if @post.save
      flash[:notice]= "created a post!"
      redirect_to("/posts/#{@topic.id}")
    else
      @error_message = "write something!"
      @posts = Post.where(topic_id: @topic.id).order(created_at: :desc)
      render("posts/show")
    end
  end


  def edit
    @post= Post.find_by(id: params[:id]) 
    @topic = Topic.find_by(id: @post.topic_id)
  end
 
 
 def update
   @post = Post.find_by(id: params[:id])
   @post.content = params[:content]
   if @post.save 
     flash[:notice] = "edit complete"
     redirect_to("/posts/#{@post.topic_id}")
   else
     @topic = Topic.find_by(id: @post.topic_id)
     @error_message = "write smomething!"
     render("posts/edit")
   end
 end
 
 
 def destroy
  @post = Post.find_by(id: params[:id])
  @post.destroy
  redirect_to("/posts/#{@post.topic_id}")
 end
 

end

