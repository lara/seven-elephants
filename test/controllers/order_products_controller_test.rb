require 'test_helper'

class OrderProductsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get order_products_create_url
    assert_response :success
  end

  test "should get update" do
    get order_products_update_url
    assert_response :success
  end

  test "should get destroy" do
    get order_products_destroy_url
    assert_response :success
  end

end
