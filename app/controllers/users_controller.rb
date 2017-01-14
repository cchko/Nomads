class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new
    @user.email = params[:email]
    @user.password = params[:password]

    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: 'Heya'
    else
      flash.now[:errors] = @user.errors.full_messages
    end
  end

end
