class UsersController < ApplicationController

  def show
    render :show
  end

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login(@user)
      flash[:success] = "Welcome! Your account has been created successfully!"
      redirect_to users_url
    else
      flash[:errors] = @user.errors.full_messages
      render :new, status: 422
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password_digest, :session_token, :password)
  end

end
