require 'test_helper'

class TotalProductsControllerTest < ActionController::TestCase
  setup do
    @total_product = total_products(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:total_products)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create total_product" do
    assert_difference('TotalProduct.count') do
      post :create, total_product: {  }
    end

    assert_redirected_to total_product_path(assigns(:total_product))
  end

  test "should show total_product" do
    get :show, id: @total_product
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @total_product
    assert_response :success
  end

  test "should update total_product" do
    patch :update, id: @total_product, total_product: {  }
    assert_redirected_to total_product_path(assigns(:total_product))
  end

  test "should destroy total_product" do
    assert_difference('TotalProduct.count', -1) do
      delete :destroy, id: @total_product
    end

    assert_redirected_to total_products_path
  end
end
