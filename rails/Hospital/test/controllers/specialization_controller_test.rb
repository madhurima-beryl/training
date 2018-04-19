require 'test_helper'

class SpecializationControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get specialization_index_url
    assert_response :success
  end

  test "should get show" do
    get specialization_show_url
    assert_response :success
  end

  test "should get new" do
    get specialization_new_url
    assert_response :success
  end

  test "should get edit" do
    get specialization_edit_url
    assert_response :success
  end

  test "should get create" do
    get specialization_create_url
    assert_response :success
  end

  test "should get update" do
    get specialization_update_url
    assert_response :success
  end

  test "should get destroy" do
    get specialization_destroy_url
    assert_response :success
  end

end
