require 'test_helper'

class SaintsControllerTest < ActionDispatch::IntegrationTest
	def setup
    @admin_user = users(:michael)
    @regular_user = users(:sterling)
    @first_saint = saints(:one)
  end

  test "should get new when logged in as an admin user" do
    log_in_as(@admin_user)
    get new_saint_path
    assert_response :success
  end

  test 'should redirect new when not logged in' do
    get new_saint_path
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should redirect new when logged in as a regular user" do
    log_in_as(@regular_user)
    get new_saint_path
    assert_redirected_to root_url
  end

  test "create should require logged-in user" do
    assert_no_difference 'Saint.count' do
      post saints_path
    end
    assert_redirected_to login_url
  end

  test "create should require admin user" do
    log_in_as(@regular_user)
    assert_no_difference 'Saint.count' do
      post saints_path
    end
    assert_redirected_to root_url
  end

  test 'should redirect edit when not logged in' do
    get edit_saint_path(@first_saint)
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test 'should redirect edit when logged in as a regular user' do
    log_in_as(@regular_user)
    get edit_saint_path(@first_saint)
    assert_redirected_to root_url
  end

  test 'should redirect update when not logged in' do
    patch saint_path(@first_saint), params: { saint: { name: @first_saint.name } }
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test 'should redirect update when logged in as a regular user' do
    log_in_as(@regular_user)
    patch saint_path(@first_saint), params: { saint: { name: @first_saint.name } }
    assert_redirected_to root_url
  end
end
