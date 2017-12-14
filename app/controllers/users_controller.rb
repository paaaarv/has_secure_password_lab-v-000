require 'pry'

class UsersController < ApplicationController

  def index
  end
  def new
    @user = User.new
  end

  def create
    if params[:password] == params[:password_confirmation]
      @user = User.new(user_params).save
      redirect_to '/homepage'
    else
      render :new
    end
  end


  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
