require 'test_helper'

class UsersFacilitiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @users_facility = users_facilities(:one)
  end

  test "should get index" do
    get users_facilities_url
    assert_response :success
  end

  test "should get new" do
    get new_users_facility_url
    assert_response :success
  end

  test "should create users_facility" do
    assert_difference('UsersFacility.count') do
      post users_facilities_url, params: { users_facility: { facility_id: @users_facility.facility_id, user_id: @users_facility.user_id } }
    end

    assert_redirected_to users_facility_url(UsersFacility.last)
  end

  test "should show users_facility" do
    get users_facility_url(@users_facility)
    assert_response :success
  end

  test "should get edit" do
    get edit_users_facility_url(@users_facility)
    assert_response :success
  end

  test "should update users_facility" do
    patch users_facility_url(@users_facility), params: { users_facility: { facility_id: @users_facility.facility_id, user_id: @users_facility.user_id } }
    assert_redirected_to users_facility_url(@users_facility)
  end

  test "should destroy users_facility" do
    assert_difference('UsersFacility.count', -1) do
      delete users_facility_url(@users_facility)
    end

    assert_redirected_to users_facilities_url
  end
end
