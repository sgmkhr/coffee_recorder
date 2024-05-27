class Public::UsersController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(current_user.id)
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path, notice: I18n.t('flash.users.update')
    else
      render :edit
    end
  end
  
  def withdraw
    current_user.update(is_active: false)
    reset_session
    redirect_to root_path
  end
  
  private
  
  def user_params
    params.require(:user).permit(:last_name, :first_name, :nick_name, :email)
  end
end
