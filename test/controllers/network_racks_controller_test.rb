require "test_helper"

class NetworkRacksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get network_racks_index_url
    assert_response :success
  end

  test "should get new" do
    get network_racks_new_url
    assert_response :success
  end

  test "should get edit" do
    get network_racks_edit_url
    assert_response :success
  end

  test "should get create" do
    get network_racks_create_url
    assert_response :success
  end

  test "should get update" do
    get network_racks_update_url
    assert_response :success
  end

  test "should get destroy" do
    get network_racks_destroy_url
    assert_response :success
  end
end
