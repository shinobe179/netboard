require "test_helper"

class RacksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get racks_index_url
    assert_response :success
  end

  test "should get new" do
    get racks_new_url
    assert_response :success
  end

  test "should get edit" do
    get racks_edit_url
    assert_response :success
  end

  test "should get create" do
    get racks_create_url
    assert_response :success
  end

  test "should get update" do
    get racks_update_url
    assert_response :success
  end

  test "should get destroy" do
    get racks_destroy_url
    assert_response :success
  end
end
