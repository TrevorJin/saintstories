require 'test_helper'

class WrittenWorkTest < ActiveSupport::TestCase
  def setup
    @saint = saints(:one)
    @written_work = @saint.written_works.build(title: "Lorem ipsum", publication_date: Date.parse('May 3rd 2017'),
    																publication_accuracy: 3, description: "Lorem ipsum fun.")
  end

  test "should be valid" do
    assert @written_work.valid?
  end

  test "saint id should be present" do
    @written_work.saint_id = nil
    assert_not @written_work.valid?
  end

  test "title should be present" do
    @written_work.title = "   "
    assert_not @written_work.valid?
  end

  test "title should be at most 300 characters" do
    @written_work.title = "a" * 301
    assert_not @written_work.valid?
  end

  test "publication date should be present" do
    @written_work.publication_date = nil
    assert_not @written_work.valid?
  end

  test "publication accuracy should be present" do
    @written_work.publication_accuracy = nil
    assert_not @written_work.valid?
  end
end
