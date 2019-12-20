require 'test_helper'

class OrdersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get orders_index_url
    assert_response :success
  end

  test "should get show" do
    get orders_show_url
    assert_response :success
  end

  test "should get new" do
    get orders_new_url
    assert_response :success
  end

  test "should get confirmation" do
    get orders_confirmation_url
    assert_response :success
  end

  test "should get thanks" do
    get orders_thanks_url
    assert_response :success
  end

  test "should get destroy" do
    get orders_destroy_url
    assert_response :success
  end

  test "should get create" do
    get orders_create_url
    assert_response :success
  end

end
