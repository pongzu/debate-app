class UsersController < ApplicationController

  before_action :authenticate_user, {only: [:show]}
  before_action :forbid_login_user,{only: [:new,:create,:login_form,:login]}

  def show
    @user = User.find_by(id: params[:id])
  end




  def followers
    @user = User.find(params[:id])
    @followers = @user.followers
  end

  def following
    @user = User.find(params[:id])
    @following = @user.following
  end


  def new
  end

  def create
    @user = User.new(name: params[:name], password: params[:password], image_name: "default_user.jpg")
    if @user.save
      session[:user_id] =@user.id
      flash[:notice] = "created your account successfully."
      redirect_to("/users/#{@user.id}")
    else
      @error_message = "wrong something."
      render("users/new")
    end 
  end

  def login_form
  end


  def login
    @user = User.find_by(name: params[:name], password: params[:password])
    if @user
      session[:user_id] = @user.id
      flash[:notice] = "logged in successfully."
      redirect_to("/users/#{@user.id}")
    else
      @error_message = "got wrong information."
      @name = params[:name]
      @password = params[:password]
      render("users/login_form")
    end
  end


  def logout
    session[:user_id] = nil
    flash[:notice] = "logged out successfully."
    redirect_to("/login")
  end


  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    @user.name = params[:name]
    @user.password = params[:password]

    if params[:image]
      @user.image_name = "#{@user.id}.jpg"
      image = params[:image]
      File.binwrite("public/user_images/#{@user.image_name}", image.read)
    end

    if @user.save
      flash[:notice] = "updated your information"
      redirect_to("/users/#{@user.id}")
    else 
      @error_message = "got wrong information."
      render("users/edit")
    end
  end

  
  def forbid_login_user
    if @current_user 
    flash[:notice] = "already logged in!"
    redirect_to("/topics/index")
    end
  end

end






