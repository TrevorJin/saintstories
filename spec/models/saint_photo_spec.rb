require 'rails_helper'

RSpec.describe SaintPhoto, type: :model do
  let (:saint_photo) { FactoryBot.create(:saint_photo) }

  it { should belong_to :saint }
  it { should validate_presence_of :saint_id }

  describe 'photo priority' do
    it { should validate_presence_of(:photo_priority) }

    context 'a saint photo with a valid photo priority' do
      let(:valid_photo_priority) { 777 }
      before do
        saint_photo.photo_priority = valid_photo_priority
      end

      it 'is valid' do
        expect(saint_photo).to be_valid
      end

      it 'may be stored in the database' do
        expect(saint_photo.save).to be_truthy
      end
    end
  end

  describe 'width' do
    it { should validate_presence_of(:width) }

    context 'a saint photo with a valid width' do
      let(:valid_width) { 777 }
      before do
        saint_photo.width = valid_width
      end

      it 'is valid' do
        expect(saint_photo).to be_valid
      end

      it 'may be stored in the database' do
        expect(saint_photo.save).to be_truthy
      end
    end
  end

  describe 'height' do
    it { should validate_presence_of(:height) }

    context 'a saint photo with a valid height' do
      let(:valid_height) { 777 }
      before do
        saint_photo.height = valid_height
      end

      it 'is valid' do
        expect(saint_photo).to be_valid
      end

      it 'may be stored in the database' do
        expect(saint_photo.save).to be_truthy
      end
    end
  end
end
