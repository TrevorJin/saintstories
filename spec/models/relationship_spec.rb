require 'rails_helper'

RSpec.describe Relationship, type: :model do
  let (:relationship) { FactoryBot.create(:relationship) }
  
  it { should belong_to :follower }
  it { should belong_to :followed }
  it { should validate_presence_of :follower_id }
  it { should validate_presence_of :followed_id }

  it "is valid with valid attributes" do
  	expect(FactoryBot.create(:relationship)).to be_valid
	end
end
