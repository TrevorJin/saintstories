require 'rails_helper'

RSpec.describe WrittenWork, type: :model do
  it { should belong_to :saint }
  it { should validate_presence_of :saint_id }
  it { should validate_presence_of :title }
  it { should validate_length_of(:title).is_at_most(300) }
  it { should validate_presence_of :publication_date }
  it { should validate_presence_of :publication_accuracy }

  it "is valid with valid attributes" do
  	expect(WrittenWork.new(saint_id: 1,
  									       title: 'Love and Responsibility',
  									       publication_date: Date.new(1960, 1, 1),
  									       publication_accuracy: 1)).to be_valid
	end
end
