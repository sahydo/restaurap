class WelcomesController < ApplicationController
  def index
    @products = Product.all.paginate(:page => params[:page], :per_page => 2)
    @typeProducts = TypeProduct.all
  end

  def unregistered
    @products = Product.all.paginate(:page => params[:page], :per_page => 2)
    @typeProducts = TypeProduct.all
  end

  def about
  end

  def contact
  end
end
