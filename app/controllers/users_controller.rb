class UsersController < ApplicationController
  before_action :require_admin, only: :index
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      @user.admin!
      flash[:notice] = "User created successfully"
      redirect_to users_path
    else
      flash[:alert] = "User not created"
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
  
    if @user.update(user_params)
      flash[:notice] = "User updated successfully"
      redirect_to users_path
    else
      flash[:alert] = "User not updated"
      render :edit, status: :unprocessable_entity
    end
  end  

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path, notice: 'User deleted'
  end

  private

  def user_params
    params.require(:user).permit(:name, :role, :password, :password_confirmation)
  end

  def require_admin
    unless current_user&.admin?
      flash[:alert] = "You must be an admin to do that."
      redirect_to root_path
    end
  end
end