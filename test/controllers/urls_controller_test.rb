require 'test_helper'

class UrlsControllerTest < ActionController::TestCase
  test "should get gallery" do
    get :gallery
    assert_response :success
  end

end
