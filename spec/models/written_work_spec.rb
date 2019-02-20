require 'rails_helper'

RSpec.describe WrittenWork, type: :model do
  let (:written_work) { FactoryBot.create(:written_work) }

  it { should belong_to :saint }
  it { should validate_presence_of :saint_id }

  describe 'title' do
    it { should validate_presence_of(:title) }

    context 'a written work with a valid title' do
      let(:valid_title) { 'Story of a Soul' }
      before do
        written_work.title = valid_title
      end

      it 'is valid' do
        expect(written_work).to be_valid
      end

      it 'may be stored in the database' do
        expect(written_work.save).to be_truthy
      end
    end

    context 'a written work with an overly long title (> 300 chars)' do
      before do
        written_work.title = 'a' * 301
      end

      it 'is invalid' do
        expect(written_work).not_to be_valid
      end

      it 'may not be stored in the database' do
        expect(written_work.save).to be_falsey
      end
    end
  end

  describe 'publication date' do
    it { should validate_presence_of(:publication_date) }

    context 'a written work with a valid publication date' do
      let(:valid_publication_date) { Date.new(1960, 1, 1) }
      before do
        written_work.publication_date = valid_publication_date
      end

      it 'is valid' do
        expect(written_work).to be_valid
      end

      it 'may be stored in the database' do
        expect(written_work.save).to be_truthy
      end
    end
  end

  describe 'publication accuracy' do
    it { should validate_presence_of(:publication_accuracy) }

    context 'a written work with a valid publication accuracy' do
      let(:valid_publication_accuracy) { 3 }
      before do
        written_work.publication_accuracy = valid_publication_accuracy
      end

      it 'is valid' do
        expect(written_work).to be_valid
      end

      it 'may be stored in the database' do
        expect(written_work.save).to be_truthy
      end
    end
  end
end
