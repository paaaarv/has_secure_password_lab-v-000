class SessionsController < ApplicationController


  def create
    @user = User.find_by(:name => params[:name])
    return head(:forbidden) unless @user.auntheticate(params[:password])
    session[:user_id] = @user.id
    redirect_to '/'
  end
end
