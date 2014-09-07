class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  layout "admin"


  def search
    if params[:search].present?
      @orders = Order.search(params[:search])
    else
      @orders = Order.all.order("created_at DESC")
    end
  end

  def sales
    @orders = Order.all.where(seller: current_user).order("created_at DESC")
  end

  def purchases
    @orders = Order.all.where(buyer: current_user).order("created_at DESC")
  end




  # GET /orders/new
  def new
    @order = Order.new
    @website = Website.find(params[:website_id])
  end



  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)
    @website = Website.find(params[:website_id])
    @seller = @website.user
    @order.website_id = @website.id

    @order.buyer_id = current_user.id
    @order.seller_id = @seller.id

    Stripe.api_key = ENV["STRIPE_API_KEY"]
    token = params[:stripeToken]

    begin
      charge = Stripe::Charge.create(
          :amount => (@website.price * 100).floor,
          :currency => "usd",
          :card => token
      )
      flash[:notice] = "Thanks for ordering!"
    rescue Stripe::CardError => e
      flash[:danger] = e.message
    end
#===============redirect to change for invoice==============================
    respond_to do |format|
      if @order.save
        format.html { redirect_to root_url}
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:address, :city, :state)
    end
end
