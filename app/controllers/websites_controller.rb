class WebsitesController < ApplicationController
  before_action :set_website, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, only: [:seller,:new, :create, :edit, :update, :destroy]
  before_filter :check_user, only: [:edit, :update, :destroy]
  before_action :check_admin, except: [:search,:index,:show]
  layout "info", except:[:show]
  layout "device", only:[:show]



  def search
    if params[:search].present?
       @websites = Website.search(params[:search])
    else
       @websites = Website.all.paginate(:page => params[:page], :per_page => 4)
    end
  end


  def seller
    @websites = Website.where(user: current_user).order("created_at DESC")
  end
  # GET /websites
  # GET /websites.json
  def index
    if params[:category].blank?
      @websites = Website.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 4)
    else
      @category_id = Category.find_by(name: params[:category]).id
      @websites = Website.where(category_id: @category_id).order("created_at DESC").paginate(:page => params[:page], :per_page => 4)
    end
  end

  # GET /websites/1
  # GET /websites/1.json
  def show
  end

  # GET /websites/new
  def new
    @website = Website.new
  end

  # GET /websites/1/edit
  def edit
  end

  # POST /websites
  # POST /websites.json
  def create
    @website = Website.new(website_params)
    @website.user_id = current_user.id

    respond_to do |format|
      if @website.save
        format.html { redirect_to @website, notice: 'Website was successfully created.' }
        format.json { render :show, status: :created, location: @website }
      else
        format.html { render :new }
        format.json { render json: @website.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /websites/1
  # PATCH/PUT /websites/1.json
  def update
    respond_to do |format|
      if @website.update(website_params)
        format.html { redirect_to @website, notice: 'Website was successfully updated.' }
        format.json { render :show, status: :ok, location: @website }
      else
        format.html { render :edit }
        format.json { render json: @website.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /websites/1
  # DELETE /websites/1.json
  def destroy
    @website.destroy
    respond_to do |format|
      format.html { redirect_to websites_url, notice: 'Website was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_website
      @website = Website.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def website_params
      params.require(:website).permit(:name,:category_id, :url, :description, :price,:webimg)
    end

  def check_user
    # unless (@website.user == current_user) || (current_user.manager?)
    if current_user != @website.user
      redirect_to root_url, alert: "Sorry, you can not access here it not belong to you"
    end
  end

  def check_admin
    unless current_user.admin?
      redirect_to root_url, alert: "sorry,only admin have access"
    end
  end
end
