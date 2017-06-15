require 'test_helper'

class CafeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get cafe_index_url
    assert_response :success
  end

  test "should get about" do
    get cafe_about_url
    assert_response :success
  end

end
