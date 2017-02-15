require 'test_helper'

class WrittenWorksControllerTest < ActionDispatch::IntegrationTest
  def setup
    @admin_user = users(:michael)
    @regular_user = users(:sterling)
    @written_work = written_works(:one)
  end

  test "create should require logged-in user" do
    assert_no_difference 'WrittenWork.count' do
      post written_works_path
    end
    assert_redirected_to login_url
  end

  test "create should require admin user" do
    log_in_as(@regular_user)
    assert_no_difference 'WrittenWork.count' do
      post written_works_path
    end
    assert_redirected_to root_url
  end

  test 'should redirect destroy when not logged in' do
    assert_no_difference 'WrittenWork.count' do
      delete written_work_path(@written_work)
    end
    assert_redirected_to login_url
  end

  test 'should redirect destroy when logged in as a non-admin' do
    log_in_as(@regular_user)
    assert_no_difference 'WrittenWork.count' do
      delete written_work_path(@written_work)
    end
    assert_redirected_to root_url
  end
end
