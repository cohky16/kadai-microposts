require 'test_helper'

class LikemodelsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get likemodels_create_url
    assert_response :success
  end

  test "should get destroy" do
    get likemodels_destroy_url
    assert_response :success
  end

end
