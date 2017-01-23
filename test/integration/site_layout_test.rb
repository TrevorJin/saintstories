require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  # Irrelevant if map is home page.
  # test 'layout links' do
  #   get root_path
  #   assert_template 'static_pages/home'
  #   assert_select 'a[href=?]', root_path, count: 2
  #   assert_select 'a[href=?]', about_path
  # end
end
