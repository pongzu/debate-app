class TopicsController < ApplicationController

def top
end


def index
  @topics = Topic.all.order(created_at: :desc)
end


def create
  @topic = Topic.new(content: params[:content],blue: params[:blue], red: params[:red], users_id: @current_user.id)
  if @topic.save
    flash[:notice]= "created a post"
    redirect_to("/posts/#{@topic.id}")
  else
    @error_message = "something is missing!"
    render("topics/top")
  end
end


def destroy
  @topic = Topic.find_by(id: params[:id])
  @topic.destroy
  flash[:notice]= "deleted a post"
  redirect_to("/users/#{@current_user.id}")
end



def show
  @topic =Topic.find_by(id: params[:id])
end

def edit
   @topic = Topic.find_by(id: params[:id]) 
end


def update
  @topic = Topic.find_by(id: params[:id])
  @topic.content = params[:content]
  @topic.blue = params[:blue]
  @topic.red = params[:red]
  if @topic.save 
    flash[:notice] = "edit complete"
    redirect_to("/topics/index")
  else
    @error_message = "something is missing!"
    render("topics/edit")
  end
end

end



