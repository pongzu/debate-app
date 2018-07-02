class TopicsController < ApplicationController


def top
end


def index
  @topics = Topic.all
end


def create
  @topic = Topic.new(content: params[:content],blue: params[:blue], red: params[:red])
  @topic.save
  redirect_to("/posts/#{@topic.id}")
end


def show
  @topic =Topic.find_by(id: params[:id])
end


end
