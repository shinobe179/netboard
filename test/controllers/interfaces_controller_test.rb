require "test_helper"

class InterfacesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get interfaces_index_url
    assert_response :success
  end

  test "should get index" do
    get interfaces_index_url
    assert_response :success
  end

  test "should get new" do
    get interfaces_new_url
    assert_response :success
  end

  test "should get edit" do
    get interfaces_edit_url
    assert_response :success
  end

  test "should get create" do
    get interfaces_create_url
    assert_response :success
  end

  test "should get update" do
    get interfaces_update_url
    assert_response :success
  end

  test "should get destroy" do
    get interfaces_destroy_url
    assert_response :success
  end
end
