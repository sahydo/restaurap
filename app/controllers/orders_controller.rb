class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.order(created_at: :desc).paginate(:page => params[:page], :per_page => 8)
    @tables = Table.all
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)

    respond_to do |format|
      if @order.save
        format.html { redirect_to order_products_of_path(@order), notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: order_products_of_path(@order) }
      else
        format.html { render :new }
        format.json { render json: order_products_of_path(@order).errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to orders_path, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: orders_path }
      else
        format.html { render :edit }
        format.json { render json: orders_path.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:id,:orderdate, :pinwaiter, :pinchef, :attenddate, :payvalue, :status, :table_id)
    end
end
