class AuthenticationController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(user_name: params[:user_name])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to "/"
      flash[:notice] = "You are signed in as #{@user.user_name}"
    else
      @user = User.new
      @user.errors[:user_name] << ' / Password combination is invalid'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
    flash[:notice] = "You have successfully signed out"
  end
end
