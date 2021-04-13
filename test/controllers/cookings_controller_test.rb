require 'test_helper'

class CookingsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get cookings_index_url
    assert_response :success
  end

end
