class IngredientsController < ApplicationController
  before_action :set_ingredient, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # GET /ingredients
  # GET /ingredients.json
  def index
    @ingredients = Ingredient.all.paginate(:page => params[:page], :per_page => 5)
    authorize @ingredients
  end

  # GET /ingredients/1
  # GET /ingredients/1.json
  def show
    authorize @ingredient
  end

  # GET /ingredients/new
  def new
    @ingredient = Ingredient.new
    authorize @ingredient
  end

  # GET /ingredients/1/edit
  def edit
    authorize @ingredient
  end

  # POST /ingredients
  # POST /ingredients.json
  def create
    @ingredient = Ingredient.new(ingredient_params)
    authorize @ingredient
    respond_to do |format|
      if @ingredient.save
        format.html { redirect_to ingredients_path, notice: 'Ingredient was successfully created.' }
        format.json { render :show, status: :created, location: ingredients_path }
      else
        format.html { render :new }
        format.json { render json:ingredients_path.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ingredients/1
  # PATCH/PUT /ingredients/1.json
  def update
    authorize @ingredient
    respond_to do |format|
      if @ingredient.update(ingredient_params)
        format.html { redirect_to ingredients_path, notice: 'Ingredient was successfully updated.' }
        format.json { render :show, status: :ok, location: ingredients_path }
      else
        format.html { render :edit }
        format.json { render json: ingredients_path.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ingredients/1
  # DELETE /ingredients/1.json
  def destroy
    authorize @ingredient
    @ingredient.destroy
    respond_to do |format|
      format.html { redirect_to ingredients_path, notice: 'Ingredient was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ingredient
      @ingredient = Ingredient.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ingredient_params
      params.require(:ingredient).permit(:name, :description)
    end
end
