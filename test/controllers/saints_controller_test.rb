require 'test_helper'

class SaintsControllerTest < ActionDispatch::IntegrationTest
	def setup
    @admin_user = users(:michael)
    @regular_user = users(:sterling)
    @published_saint = saints(:one)
    @unpublished_saint = saints(:unpublished)
  end

  test "should get index" do
    get saints_path
    assert_response :success
  end

  test "should get show" do
    get saint_path(@published_saint)
    assert_response :success
  end

  test "should get show with unpublished saint and logged in" do
    log_in_as(@regular_user)
    get saint_path(@unpublished_saint)
    assert_response :success
  end

  test "should redirect show when not logged in and saint is not published" do
    get saint_path(@unpublished_saint)
    assert_redirected_to saints_url
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

  test "create should require logged in user" do
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

  test 'should get edit when logged in as an admin user' do
    log_in_as(@admin_user)
    get edit_saint_path(@published_saint)
    assert_response :success
  end

  test 'should redirect edit when not logged in' do
    get edit_saint_path(@published_saint)
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test 'should redirect edit when logged in as a regular user' do
    log_in_as(@regular_user)
    get edit_saint_path(@published_saint)
    assert_redirected_to root_url
  end

  test 'should redirect update when not logged in' do
    patch saint_path(@published_saint), params: { saint: { name: @published_saint.name } }
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test 'should redirect update when logged in as a regular user' do
    log_in_as(@regular_user)
    patch saint_path(@published_saint), params: { saint: { name: @published_saint.name } }
    assert_redirected_to root_url
  end
end
