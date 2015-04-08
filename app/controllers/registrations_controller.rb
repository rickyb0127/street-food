class RegistrationsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params.require(:user).permit(:user_name, :password))
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Thanks for signing up"
      redirect_to "/"
    else
      render :new
    end
  end
end
