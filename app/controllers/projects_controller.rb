class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :check_user_and_manager, except: [:index,:show]

  layout "admin"

  def search
    if params[:search].present?
      @projects = Project.search(params[:search])
    else
      @projects = Project.all.order("created_at DESC")
    end
  end



  # GET /projects
  # GET /projects.json
  def index
    @projects = Project.all

  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    @reviews = Review.where(project_id: @project.id).order("created_at DESC")
  end

  # GET /projects/new
  def new
    @project = Project.new
    @users = User.all
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(project_params)

    respond_to do |format|
      if @project.save

        # Deliver the confirmation
        UserNotifier.send_confirmation_project_email(@project.user).deliver

        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
      unless (current_user == @project.user) || (current_user.manager?)
        redirect_to root_url, alert: "Sorry, you can not access here, it not belong to you"
      end

    end

  def check_user_and_manager
    unless current_user.manager?
      redirect_to root_url, alert: "Sorry only manager can do that"
    end
  end


    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:title,:user_id, :description, :progress, :link)
    end
end
