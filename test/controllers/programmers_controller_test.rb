require 'test_helper'

class ProgrammersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get programmers_index_url
    assert_response :success
  end

  test "should get show" do
    get programmers_show_url
    assert_response :success
  end

  test "should get new" do
    get programmers_new_url
    assert_response :success
  end

  test "should get edit" do
    get programmers_edit_url
    assert_response :success
  end

  test "should get create" do
    get programmers_create_url
    assert_response :success
  end

  test "should get update" do
    get programmers_update_url
    assert_response :success
  end

  test "should get destroy" do
    get programmers_destroy_url
    assert_response :success
  end

end
