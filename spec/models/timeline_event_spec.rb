require 'rails_helper'

RSpec.describe TimelineEvent, type: :model do
  let (:timeline_event) { FactoryBot.build(:timeline_event) }

  it { should belong_to :saint }
  it { should validate_presence_of :saint_id }

  describe 'event priority' do
    it { should validate_presence_of(:event_priority) }

    context 'a timeline event with a valid event priority' do
      let(:valid_event_priority) { 777 }
      before do
        timeline_event.event_priority = valid_event_priority
      end

      it 'is valid' do
        expect(timeline_event).to be_valid
      end

      it 'may be stored in the database' do
        expect(timeline_event.save).to be_truthy
      end
    end
  end

  describe 'event title' do
    it { should validate_presence_of(:event_title) }

    context 'a timeline event with a valid event title' do
      let(:valid_event_title) { 'Elected Pope' }
      before do
        timeline_event.event_title = valid_event_title
      end

      it 'is valid' do
        expect(timeline_event).to be_valid
      end

      it 'may be stored in the database' do
        expect(timeline_event.save).to be_truthy
      end
    end
  end

  describe 'event time' do
    it { should validate_presence_of(:event_time) }

    context 'a timeline event with a valid event time' do
      let(:valid_event_time) { 'October 16th, 1978' }
      before do
        timeline_event.event_time = valid_event_time
      end

      it 'is valid' do
        expect(timeline_event).to be_valid
      end

      it 'may be stored in the database' do
        expect(timeline_event.save).to be_truthy
      end
    end
  end

  describe 'event description' do
    it { should validate_presence_of(:event_description) }

    context 'a timeline event with a valid event description' do
      let(:valid_event_description) { 'Cardinal Karol Wojtyła becomes the first
                                       non-Italian pope in 455 years, at the young
                                       age of 58.' }
      before do
        timeline_event.event_description = valid_event_description
      end

      it 'is valid' do
        expect(timeline_event).to be_valid
      end

      it 'may be stored in the database' do
        expect(timeline_event.save).to be_truthy
      end
    end
  end
end
