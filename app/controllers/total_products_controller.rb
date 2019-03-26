class TotalProductsController < ApplicationController
  before_action :set_total_product, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /total_products
  # GET /total_products.json
  def index
    if params[:id].present?
      @total_products = TotalProduct.where("product_id = #{params[:id]}").paginate(:page => params[:page], :per_page => 5)
      @ingredients = Ingredient.all
      @product = Product.find(params[:id])
    elsif params[:product_id].present?
      @total_products = TotalProduct.where("product_id = #{params[:product_id]}").paginate(:page => params[:page], :per_page => 5)
      @ingredients = Ingredient.all
      @product = Product.find(params[:product_id])
    else
      @total_products = TotalProduct.all.paginate(:page => params[:page], :per_page => 5)
      @ingredients = Ingredient.all
      @products = Product.all
    end
    authorize @total_products
  end


  # GET /total_products/1
  # GET /total_products/1.json
  def show
    authorize @total_product
  end

  # GET /total_products/new
  def new
    if params[:id].present?
      @product = Product.find(params[:id])
      @total_products = TotalProduct.where("product_id = #{params[:id]}")
    elsif params[:product_id].present?
      @product = Product.find(params[:product_id])
      @total_products = TotalProduct.where("product_id = #{params[:product_id]}")
    end
    @products = Product.all
    @ingredients = Ingredient.all.paginate(:page => params[:page], :per_page => 5)
    
    @total_product = TotalProduct.new
    authorize @total_product
  end

  # GET /total_products/1/edit
  def edit
    authorize @total_product
  end

  # POST /total_products
  # POST /total_products.json
  def create
    @total_product = TotalProduct.new(total_product_params)
    authorize @total_product
    respond_to do |format|
      if @total_product.save
        @product = Product.find(@total_product.product_id)
        format.html { redirect_to total_products_of_path(@product), notice: 'Total product was successfully created.' }
        format.json { render :show, status: :created, location: total_products_of_path(@product) }
      else
        format.html { render :new }
        format.json { render json: total_products_of_path(@product).errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /total_products/1
  # PATCH/PUT /total_products/1.json
  def update
    authorize @total_product
    respond_to do |format|
      if @total_product.update(total_product_params)
        @product = Product.find(@total_product.product_id)
        format.html { redirect_to total_products_of_path(@product), notice: 'Total product was successfully updated.' }
        format.json { render :show, status: :ok, location: total_products_of_path(@product) }
      else
        format.html { render :edit }
        format.json { render json: total_products_of_path(@product).errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /total_products/1
  # DELETE /total_products/1.json
  def destroy
    @product = Product.find(@total_product.product_id)
    @total_product.destroy
    authorize @total_product
    respond_to do |format|
      format.html { redirect_to new_total_product_of_path(@product), notice: 'Total product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_total_product
      @total_product = TotalProduct.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def total_product_params
      params.require(:total_product).permit(:ingredient_id,:product_id)
    end
end
