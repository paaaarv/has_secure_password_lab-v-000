require 'pry'

class UsersController < ApplicationController

  def index
  end
  def new
    @user = User.new
  end

  def create
    binding.pry
    @user = User.new(user_params).save

  end


  private

  def user_params
    params.require(@user).permit(:name, :password, :password_confirmation)
  end
end
