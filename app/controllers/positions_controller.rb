class PositionsController < ApplicationController

  def create 
    @position = Position.create(position: params[:position], topic_id: params[:topic_id], user_id: @current_user.id)
    redirect_to("/posts/#{@position.topic_id}")
  end

 




end
