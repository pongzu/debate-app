class UsersController < ApplicationController

  def show
    @user = User.find_by(id: params[:id])
  end


  def create
    @user = User.new(name: params[:name], password: params[:password])
    @user.save
    redirect_to("/users/#{@user.id}")
  end


  def login_form
  end

  def login
    @user = User.find_by(id: params[:id])
    if @user
      flash[:notice] = "ログイン成功だよん"
      redirect_to("/users/#{@user.id}")
    else
      render("users/login_form")
    end
  end
end
