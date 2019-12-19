require 'test_helper'

class CostomersControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get costomers_edit_url
    assert_response :success
  end

  test "should get show" do
    get costomers_show_url
    assert_response :success
  end

  test "should get update" do
    get costomers_update_url
    assert_response :success
  end

  test "should get cancel" do
    get costomers_cancel_url
    assert_response :success
  end

end
