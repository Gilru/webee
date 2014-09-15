class UsersController < ApplicationController
  before_filter :authenticate_user!
  before_action :check_user_and_manager, except: [:show]
  before_action :check_user_and_admin, only: [:destroy]

  layout "admin"

  def search
    if params[:search].present?
      @users = User.search(params[:search])
    else
      @users = User.all.order("created_at DESC")
    end
  end



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


  private

  def check_user_and_manager
    unless current_user.manager?
      redirect_to root_url, alert: "Sorry only manager can have access"
    end
  end

  def check_user_and_admin
    unless current_user.admin?
      redirect_to root_url, alert: "Sorry only admin can have access"
    end
  end
end
