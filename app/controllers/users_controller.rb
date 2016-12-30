class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:notice] = "Welcome to Bloccit #{@user.name}!"
      create_session(@user)
      redirect_to root_path
    else
      flash[:error] = "There was an error creating your account. Please try again."
      render :new
    end
  end

  def user_params
    params[:user].permit(:name, :email, :password, :password_confirmation)
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.visible_to(current_user)
  end

  def has_no_submissions?(user)
    if @posts = 0
      true
    end
    if @comments = 0
      true
    end
  end

  def no_submissions_message(user)
    "{user.name} has not submitted any yet."
  end

end
