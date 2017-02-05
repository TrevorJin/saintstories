require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  def setup
    @admin_user = users(:michael)
    @non_approved_user = users(:flaky)
    @deactivated_user = users(:crusty)
    @regular_user = users(:sterling)
    @other_user = users(:jeremiah)
  end

  test 'should redirect index when not logged in' do
    get users_path
    assert_redirected_to login_url
  end

  test 'should get new' do
    get signup_path
    assert_response :success
  end

  test 'should redirect edit when not logged in' do
    get edit_user_path(@admin_user)
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test 'should redirect update when not logged in' do
    patch user_path(@admin_user), params: { user: { name: @admin_user.name,
                                                    email: @admin_user.email } }
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test 'should redirect edit when logged in as wrong user' do
    log_in_as(@other_user)
    get edit_user_path(@admin_user)
    assert flash.empty?
    assert_redirected_to root_url
  end

  test 'should redirect update when logged in as wrong user' do
    log_in_as(@other_user)
    patch user_path(@admin_user), params: { user: { name: @admin_user.name,
                                                    email: @admin_user.email } }
    assert flash.empty?
    assert_redirected_to root_url
  end

  test 'should redirect destroy when not logged in' do
    assert_no_difference 'User.count' do
      delete user_path(@admin_user)
    end
    assert_redirected_to login_url
  end

  test 'should redirect destroy when logged in as a non-admin' do
    log_in_as(@other_user)
    assert_no_difference 'User.count' do
      delete user_path(@admin_user)
    end
    assert_redirected_to root_url
  end

  # Is not reading the custom Date Time Picker SimpleForm input as it should.
  # test "should get pending users when logged in as an admin user" do
  #   log_in_as(@admin_user)
  #   get pending_users_path(@regular_user)
  #   assert_response :success
  #   assert_template :pending_users
  #   assert_template layout: "layouts/application"
  # end

  test "should get approve account when logged in as an admin user" do
    log_in_as(@admin_user)
    get approve_account_user_path(@non_approved_user)
    assert_redirected_to pending_users_url
  end

  test "should redirect approve account when not logged in" do
    get approve_account_user_path(@non_approved_user)
    assert_redirected_to login_url
  end

  test "should redirect approve account logged in as a regular user" do
    log_in_as(@regular_user)
    get approve_account_user_path(@non_approved_user)
    assert_redirected_to root_url
  end

  test "should get deactivate user when logged in as an admin user" do
    log_in_as(@admin_user)
    get deactivate_user_user_path(@non_approved_user)
    assert_redirected_to user_path(@non_approved_user)
  end

  test "should redirect deactivate user when not logged in" do
    get deactivate_user_user_path(@regular_user)
    assert_redirected_to login_url
  end

  test "should redirect deactivate user when logged in as a regular user" do
    log_in_as(@regular_user)
    get deactivate_user_user_path(@regular_user)
    assert_redirected_to root_url
  end

  test "should get reactivate user when logged in as an admin user" do
    log_in_as(@admin_user)
    get reactivate_user_user_path(@deactivated_user)
    assert_redirected_to user_path(@deactivated_user)
  end

  test "should redirect reactivate user when not logged in" do
    get reactivate_user_user_path(@deactivated_user)
    assert_redirected_to login_url
  end

  test "should redirect reactivate user when logged in as a regular user" do
    log_in_as(@regular_user)
    get reactivate_user_user_path(@deactivated_user)
    assert_redirected_to root_url
  end

  test "should get promote to admin when logged in as an admin user" do
    log_in_as(@admin_user)
    get promote_to_admin_user_path(@regular_user)
    assert_redirected_to user_path(@regular_user)
  end

  test "should redirect promote to admin when not logged in" do
    get promote_to_admin_user_path(@regular_user)
    assert_redirected_to login_url
  end

  test "should redirect promote to admin when logged in as a regular user" do
    log_in_as(@regular_user)
    get promote_to_admin_user_path(@regular_user)
    assert_redirected_to root_url
  end

  test "should get demote to user when logged in as an admin user" do
    log_in_as(@admin_user)
    get demote_to_user_user_path(@admin_user)
    assert_redirected_to user_path(@admin_user)
  end

  test "should redirect demote to user when not logged in" do
    get demote_to_user_user_path(@admin_user)
    assert_redirected_to login_url
  end

  test "should redirect demote to user when logged in as a regular user" do
    log_in_as(@regular_user)
    get demote_to_user_user_path(@admin_user)
    assert_redirected_to root_url
  end
end
