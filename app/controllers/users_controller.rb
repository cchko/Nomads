class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

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
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
    render 'show' if @user.id != current_user.id
  end

  def update
    @user = User.find(params[:id])
    @user.email = params[:email]
    @user.password = params[:password] if params[:password].present?
    @user.first_name = params[:first_name]
    @user.last_name = params[:last_name]
    @user.age = params[:age]
    @user.phone = params[:phone]
    binding.pry

    if @user.save
      redirect_to user_path(@user), notice: 'Got it'
    else
      flash.now[:errors] = @user.errors.full_messages
      render 'edit'
    end
  end

end
