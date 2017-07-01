require 'rails_helper'

RSpec.describe TimelineEvent, type: :model do
  it { should belong_to :saint }
  it { should validate_presence_of :saint_id }
  it { should validate_presence_of :event_priority }
  it { should validate_presence_of :event_title }
  it { should validate_presence_of :event_time }

  it "is valid with valid attributes" do
  	expect(TimelineEvent.new(saint_id: 1,
  									         event_priority: 100,
  									         event_title: 'Born in Wadowice, Poland',
  									         event_time: 'May 18th, 1920')).to be_valid
	end
end
