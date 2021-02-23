require "test_helper"

class UserTrailersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_trailers_index_url
    assert_response :success
  end
end
