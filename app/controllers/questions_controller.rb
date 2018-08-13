class QuestionsController < ApplicationController

 def show
  if params[:id].to_i != 0
   @question = Question.find_by(id: params[:id])
  else
    @current_user.point = 0   #renew userpoint 
    @current_user.save
    @question = Question.find(1)
  end
 end


def count_point
  @question = Question.find_by(id: params[:id])
   if params[:id].to_i <= 2 && params[:point].to_i == 1
     @current_user.point += 1
     @question.id += 1
     @current_user.save
     redirect_to("/questions/#{@question.id}/show")
   elsif params[:id].to_i <= 2 && params[:point].to_i != 1 
     @question.id += 1
     redirect_to("/questions/#{@question.id}/show")
   else
     redirect_to(action: 'sum')
   end
end


 def sum 
   @current_user.nick_name =  
      case @current_user.point
       when 0 then "名無しさん"
       when 1 then "あだ名１"
       when 2 then "あだ名2"
       when 3 then "あだな３"
       when 4 then "あだな4"
      end
     @current_user.save
     redirect_to(action: 'result')
 end

 def result
   @nick_name = @current_user.nick_name
 end

end



