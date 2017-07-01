require 'rails_helper'

RSpec.describe SaintPhoto, type: :model do
  it { should belong_to :saint }
  it { should validate_presence_of :saint_id }
  it { should validate_presence_of :photo_priority }
  it { should validate_presence_of :width }
  it { should validate_presence_of :height }

  it "is valid with valid attributes" do
  	expect(SaintPhoto.new(saint_id: 1,
  									      photo_priority: 100,
  									      width: 300,
  									      height: 400)).to be_valid
	end
end
