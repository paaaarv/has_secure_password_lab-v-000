require 'pry'

class UsersController < ApplicationController

  def index
  end
  def new
    @user = User.new
  end

  def create
    if user_params[:password] == user_params[:password_confirmation]
      @user = User.new(user_params)
      @user.save
      session[:user_id] = @user.id
      redirect_to '/login'
    else
      redirect_to '/users/new'
    end
  end


  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
