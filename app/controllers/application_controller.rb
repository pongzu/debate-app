class ApplicationController < ActionController::Base

    before_action :set_current_user

    def set_current_user
        @current_user = User.find_by(id: session[:user_id])
    end

    def authenticate_user
        if @current_user == nil 
        flash[:notice] = "need to login"
        redirect_to("/topics/index")
        end
    end
end



