require 'test_helper'

class DoctorControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get doctor_index_url
    assert_response :success
  end

  test "should get show" do
    get doctor_show_url
    assert_response :success
  end

  test "should get new" do
    get doctor_new_url
    assert_response :success
  end

  test "should get edit" do
    get doctor_edit_url
    assert_response :success
  end

  test "should get create" do
    get doctor_create_url
    assert_response :success
  end

  test "should get update" do
    get doctor_update_url
    assert_response :success
  end

  test "should get destroy" do
    get doctor_destroy_url
    assert_response :success
  end

end
