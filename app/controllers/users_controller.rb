class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def confirm
    @user = User.new(user_params)
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Welcome to Bloccit #{@user.name}!"
      redirect_to root_path
    else
      flash[:error] = "There was an error creating your account. Please try again."
      render :new
    end
  end

  def user_params
    params[:user].permit(:name, :email, :password, :password_confirmation)
  end

end