require 'pry'

class SessionsController < ApplicationController


  def create
    @user = User.find_by(:name => params[:name])
    if @user == nil
      redirect_to '/users/new'
    else
      return head(:forbidden) unless @user.auntheticate(params[:password])
      binding.pry
      session[:user_id] = @user.id
      redirect_to '/users'
    end
  end
end
