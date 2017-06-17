require 'test_helper'

class SaintTest < ActiveSupport::TestCase
  def setup
    @saint =
      Saint.new(name: 'St. Thérèse of Lisieux',
                gender: 'Female',
                feast_day: Date.new(1897, 10, 01),
                birth_date: DateTime.parse('January 2nd 1873 00:00:00 AM'),
                birth_accuracy: 3,
                death_date: DateTime.parse('September 30th 1897 00:00:00 AM'),
                death_accuracy: 3,
                birth_location: 'Alençon, Orne, France',
                birth_latitude: 48.4329,
                birth_longitude: 0.0913,
                death_location: 'Lisieux, Calvados, France',
                death_latitude: 49.1459,
                death_longitude: 0.2278,
                beatification_date: Date.new(1923, 04, 29),
                beatification_accuracy: 3,
                canonization_date: Date.new(1925, 05, 17),
                canonization_accuracy: 3,
                short_description: 'Hi',
                long_description: 'Hello',
                pope: false, cardinal: false, bishop: false, priest: false,
                religious: true, lay: false, martyr: false, founder: false,
                mystic: true, royalty: false, doctor_of_the_church: true,
                early_church_father: false,
                canonization_status: 'Saint',
                fame_level: 50)
  end

  test 'should be valid' do
    assert @saint.valid?
  end

  test 'name should be present' do
    @saint.name = '     '
    assert_not @saint.valid?
  end

  test 'name should not be too long' do
    @saint.name = 'a' * 256
    assert_not @saint.valid?
  end

  test 'gender should be present' do
    @saint.gender = '     '
    assert_not @saint.valid?
  end

  test 'feast day should be present' do
    @saint.feast_day = nil
    assert_not @saint.valid?
  end

  test 'short description should be present' do
    @saint.short_description = nil
    assert_not @saint.valid?
  end

  test 'long description should be present' do
    @saint.long_description = nil
    assert_not @saint.valid?
  end

  test 'canonization status should be present' do
    @saint.canonization_status = nil
    assert_not @saint.valid?
  end

  test "should follow and unfollow a saint" do
    michael = saints(:one)
    sebastian  = saints(:two)
    assert_not michael.following?(sebastian)
    michael.follow(sebastian)
    assert michael.following?(sebastian)
    assert sebastian.followers.include?(michael)
    michael.unfollow(sebastian)
    assert_not michael.following?(sebastian)
  end

  test "associated written works should be destroyed" do
    @saint.save
    @saint.written_works.create!(title: "Lorem ipsum", publication_date: Date.parse('May 3rd 2017'),
                                 publication_accuracy: 3, description: "Lorem ipsum fun.")
    assert_difference 'WrittenWork.count', -1 do
      @saint.destroy
    end
  end
end
