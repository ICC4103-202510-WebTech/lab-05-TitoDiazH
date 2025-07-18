class UsersController < ApplicationController
  
  before_action :authenticate_user!
  load_and_authorize_resource
  
  def index
    unless current_user.admin?
      redirect_to chats_path, alert: "You must be a admin to view the users list."
      return
    end
    @users = User.all
  end
    
  def show
    @user = User.find(params["id"])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_path, notice: 'User created successfully.'
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :password)
  end
end
