require 'test_helper'

class FavoritemodelsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get favoritemodels_create_url
    assert_response :success
  end

  test "should get destroy" do
    get favoritemodels_destroy_url
    assert_response :success
  end

end
