class UsersController < ApplicationController
  before_action :logged_in_user, only:[:index,:show]
  before_action :already_logged?, only:[:new]

  def notifications
    @user = User.all
  end

  def index
    @user = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in(@user)
      redirect_to @user
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private
    def user_params
      params.require(:user).permit(:username, :fullname, :avatar)
    end
end
