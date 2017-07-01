require 'rails_helper'

RSpec.describe Saint, type: :model do
  it { should have_many(:active_relationships).dependent(:destroy) }
  it { should have_many(:passive_relationships).dependent(:destroy) }
  it { should have_many(:following).through(:active_relationships) }
  it { should have_many(:followers).through(:passive_relationships) }
  it { should have_many(:written_works).dependent(:destroy) }
  it { should have_many(:timeline_events).dependent(:destroy) }
  it { should have_many(:saint_photos).dependent(:destroy) }

  it do
  	should validate_presence_of(:name).
  		with_message('name required')
  end

  it do
    should validate_length_of(:name).
      is_at_most(255).
      with_message("must be 255 characters or less")
  end

  it do
  	should validate_presence_of(:gender).
  		with_message('gender required')
  end

  it do
  	should validate_presence_of(:feast_day).
  		with_message('feast day required')
  end

  it do
  	should validate_presence_of(:short_description).
  		with_message('short description required')
  end

  it do
  	should validate_presence_of(:long_description).
  		with_message('long description required')
  end

  it do
  	should validate_presence_of(:canonization_status).
  		with_message('canonization status required')
  end

  it do
  	should validate_presence_of(:fame_level).
  		with_message('fame level required')
  end

	it "is valid with valid attributes" do
  	expect(Saint.new(name: 'St. Maximilian Kolbe',
  									 gender: 'Male',
  									 feast_day: '2017-08-14',
  									 short_description: 'Martyr of Charity at Auschwitz.',
  									 long_description: 'Martyr of Charity at Auschwitz.',
  									 canonization_status: 'Saint',
  									 fame_level: 80)).to be_valid
	end
end
