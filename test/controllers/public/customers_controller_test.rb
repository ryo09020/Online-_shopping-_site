require "test_helper"

class Public::CustomersControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get public_customers_edit_url
    assert_response :success
  end

  test "should get quit" do
    get public_customers_quit_url
    assert_response :success
  end
end
