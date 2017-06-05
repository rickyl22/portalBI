require 'test_helper'

class MenuControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get menu_index_url
    assert_response :success
  end

  test "should get new" do
    get menu_new_url
    assert_response :success
  end

  test "should get create" do
    get menu_create_url
    assert_response :success
  end

  test "should get show" do
    get menu_show_url
    assert_response :success
  end

  test "should get edit" do
    get menu_edit_url
    assert_response :success
  end

  test "should get update" do
    get menu_update_url
    assert_response :success
  end

  test "should get destroy" do
    get menu_destroy_url
    assert_response :success
  end

end
