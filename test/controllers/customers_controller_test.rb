require 'test_helper'

class CustomersControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get customers_edit_url
    assert_response :success
  end

  test "should get show" do
    get customers_show_url
    assert_response :success
  end

  test "should get updete" do
    get customers_updete_url
    assert_response :success
  end

  test "should get cancel" do
    get customers_cancel_url
    assert_response :success
  end

end
