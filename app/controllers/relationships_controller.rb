class RelationshipsController < ApplicationController

def create
    Relationship.create(follower_id: @current_user.id, following_id: params[:following_id].to_i)
    redirect_to("/users/#{params[:following_id].to_i}")
end

def destroy
    @relation = Relationship.find_by(follower_id: @current_user.id, following_id: params[:following_id].to_i)
    @relation.destroy
    redirect_to("/users/#{params[:following_id].to_i}")
end



end
