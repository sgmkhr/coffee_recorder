require "test_helper"

class Public::CoffeesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get public_coffees_new_url
    assert_response :success
  end

  test "should get index" do
    get public_coffees_index_url
    assert_response :success
  end

  test "should get edit" do
    get public_coffees_edit_url
    assert_response :success
  end
end
