class PositionsController < ApplicationController

  def create 
    @position = Position.new(position: params[:position], topic_id: params[:topic_id], user_id: @current_user.id)
    @position.save
    redirect_to("/posts/#{@position.topic_id}")
  end

 



end
