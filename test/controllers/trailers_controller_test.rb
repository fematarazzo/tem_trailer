require "test_helper"

class TrailersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get trailers_index_url
    assert_response :success
  end

  test "should get show" do
    get trailers_show_url
    assert_response :success
  end

  test "should get new" do
    get trailers_new_url
    assert_response :success
  end

  test "should get create" do
    get trailers_create_url
    assert_response :success
  end

  test "should get edit" do
    get trailers_edit_url
    assert_response :success
  end

  test "should get update" do
    get trailers_update_url
    assert_response :success
  end

  test "should get destroy" do
    get trailers_destroy_url
    assert_response :success
  end
end
