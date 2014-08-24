class UsersController < ApplicationController
  layout "admin"

  def index
    @users = User.all
  end

  def show

  end

  def destroy
    @user = User.find(params[:id])

    if @user.destroy
      redirect_to root_url, notice: "User deleted."
    end
  end
end
