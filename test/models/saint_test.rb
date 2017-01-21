require 'test_helper'

class SaintTest < ActiveSupport::TestCase
  
  def setup
  	@saint = Saint.new(name: "St. Thérèse of Lisieux", gender: "Female",
  										 feast_day: Date.new(1897, 10, 01),
  										 birth_date: DateTime.parse('January 2nd 1873 00:00:00 AM'),
  										 birth_accuracy: 3,
  										 death_date: DateTime.parse('September 30th 1897 00:00:00 AM'),
  										 death_accuracy: 3,
  										 birth_location: "Alençon, Orne, France",
                       birth_latitude: 48.4329,
                       birth_longitude: 0.0913,
  										 death_location: "Lisieux, Calvados, France",
                       death_latitude: 49.1459,
                       death_longitude: 0.2278,
  										 beatification_date: Date.new(1923, 04, 29),
  										 canonization_date: Date.new(1925, 05, 17),
  										 pope: false, cardinal: false, bishop: false, priest: false,
  										 religious: true, lay: false, martyr: false, founder: false,
  										 mystic: true, doctor_of_the_church: true, early_church_father: false)
  end

  test "should be valid" do
  	assert @saint.valid?
  end

  test "name should be present" do
  	@saint.name = "     "
  	assert_not @saint.valid?
  end

  test "name should not be too long" do
    @saint.name = "a" * 256
    assert_not @saint.valid?
  end

  test "gender should be present" do
  	@saint.gender = "     "
  	assert_not @saint.valid?
  end

  test "feast_day should be present" do
  	@saint.feast_day = nil
  	assert_not @saint.valid?
  end

  test "birth date should be present" do
  	@saint.birth_date = nil
  	assert_not @saint.valid?
  end

  test "birth accuracy should be present" do
  	@saint.birth_accuracy = nil
  	assert_not @saint.valid?
  end

  test "death date should be present" do
  	@saint.death_date = nil
  	assert_not @saint.valid?
  end

  test "death accuracy should be present" do
  	@saint.death_accuracy = nil
  	assert_not @saint.valid?
  end

  test "birth location should be present" do
  	@saint.birth_location = "     "
  	assert_not @saint.valid?
  end

  test "birth location should not be too long" do
    @saint.birth_location = "a" * 256
    assert_not @saint.valid?
  end

  test "birth latitude should be present" do
    @saint.birth_latitude = nil
    assert_not @saint.valid?
  end

  test "birth longitude should be present" do
    @saint.birth_longitude = nil
    assert_not @saint.valid?
  end

  test "death location should be present" do
  	@saint.death_location = "     "
  	assert_not @saint.valid?
  end

  test "death location should not be too long" do
    @saint.death_location = "a" * 256
    assert_not @saint.valid?
  end

  test "death latitude should be present" do
    @saint.death_latitude = nil
    assert_not @saint.valid?
  end

  test "death longitude should be present" do
    @saint.death_longitude = nil
    assert_not @saint.valid?
  end

  test "beatification date should be present" do
  	@saint.beatification_date = nil
  	assert_not @saint.valid?
  end

  test "canonization date should be present" do
  	@saint.canonization_date = nil
  	assert_not @saint.valid?
  end
end
