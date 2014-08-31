class UsersController < ApplicationController
  before_filter :authenticate_user!
  layout "admin"

  def index
    @users = User.all.order("created_at DESC")
  end

  def show
    @users = User.all
  end

  def destroy
    @user = User.find(params[:id])

    if @user.destroy
      redirect_to root_url, notice: "User deleted."
    end
  end
end
