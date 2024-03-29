class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  before_action :set_project
  before_action :authenticate_user!
  before_action :check_user_and_manager, only: [:edit,:update,:destroy]
  before_action :check_user, only:  [:edit,:update,:destroy]

  layout "admin"

  # GET /reviews
  # GET /reviews.json
  def index
    @reviews = Review.all
  end

  # GET /reviews/1
  # GET /reviews/1.json
  def show
  end

  # GET /reviews/new
  def new
    @review = Review.new
  end

  # GET /reviews/1/edit
  def edit
  end

  # POST /reviews
  # POST /reviews.json
  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.project_id = @project.id

    respond_to do |format|
      if @review.save
        if current_user.admin?
          # Deliver the confirmation
          UserNotifier.send_confirmation_review_ready(@review.project.user, self).deliver
        else
          UserNotifier.send_confirmation_review(@review.project.user, self).deliver
        end

        format.html { redirect_to @project, notice: 'your message has been successfully sent' }
        format.json { render :show, status: :created, location: @review }
      else
        format.html { render :new }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reviews/1
  # PATCH/PUT /reviews/1.json
  def update
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to project_path(@project), notice: 'Review was successfully updated.' }
        format.json { render :show, status: :ok, location: @review }
      else
        format.html { render :edit }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  def destroy
    @review.destroy
    respond_to do |format|
      format.html { redirect_to project_path(@project), notice: 'Review was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    def set_project
       @project = Project.find(params[:project_id])
    end

    def check_user
       unless (@review.user == current_user) || (current_user.admin?)
         redirect_to root_url, alert: "Sorry, you are not authorized to access this section"
       end
    end

  def check_user_and_manager
    unless current_user.manager?
      redirect_to root_url, alert: "Sorry only manager can do that"
    end
  end

    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:review).permit(:comment)
    end
end
