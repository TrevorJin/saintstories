require 'rails_helper'

RSpec.describe Relationship, type: :model do
  it { should belong_to :follower }
  it { should belong_to :followed }
  it { should validate_presence_of :follower_id }
  it { should validate_presence_of :followed_id }

  it "is valid with valid attributes" do
  	expect(Relationship.new(follower_id: 1,
  									        followed_id: 2)).to be_valid
	end
end
