require 'pry'

class SessionsController < ApplicationController


  def create
    @user = User.find_by(:name => params[:name])
    if @user
      return head(:forbidden) unless @user.auntheticate(params[:password])
      session[:user_id] = @user.id
      binding.pry
      redirect_to '/login'
    else
      redirect_to '/users/new'
    end
  end
end
