require 'rails_helper'

RSpec.describe Saint, type: :model do
  let (:saint) { FactoryGirl.build(:saint) }

  it { should have_many(:active_relationships).dependent(:destroy) }
  it { should have_many(:passive_relationships).dependent(:destroy) }
  it { should have_many(:following).through(:active_relationships) }
  it { should have_many(:followers).through(:passive_relationships) }
  it { should have_many(:written_works).dependent(:destroy) }
  it { should have_many(:timeline_events).dependent(:destroy) }
  it { should have_many(:saint_photos).dependent(:destroy) }

  describe 'name' do
    it { should validate_presence_of(:name).
           with_message('name required') }
    it { should validate_length_of(:name).is_at_most(255).
           with_message("must be 255 characters or less") }

    context 'a saint with a valid name' do
      let(:valid_name) { 'St. Francis of Assisi' }
      before do
        saint.name = valid_name
      end

      it 'is valid' do
        expect(saint).to be_valid
      end

      it 'may be stored in the database' do
        expect(saint.save).to be_truthy
      end
    end

    context 'a saint with an overly long name (> 255 chars)' do
      before do
        saint.name = 'a' * 256
      end

      it 'is invalid' do
        expect(saint).not_to be_valid
      end

      it 'may not be stored in the database' do
        expect(saint.save).to be_falsey
      end
    end
  end

  describe 'gender' do
    it { should validate_presence_of(:gender).
           with_message('gender required') }

    context 'a saint with a valid gender' do
      let(:valid_gender) { 'Female' }
      before do
        saint.gender = valid_gender
      end

      it 'is valid' do
        expect(saint).to be_valid
      end

      it 'may be stored in the database' do
        expect(saint.save).to be_truthy
      end
    end
  end

  describe 'feast day' do
    it { should validate_presence_of(:feast_day).
           with_message('feast day required') }

    context 'a saint with a valid feast day' do
    let(:valid_feast_day) { Date.new(1990, 1, 14) }
      before do
        saint.feast_day = valid_feast_day
      end

      it 'is valid' do
        expect(saint).to be_valid
      end

      it 'may be stored in the database' do
        expect(saint.save).to be_truthy
      end
    end
  end

  describe 'birth date' do
    context 'a saint with a valid birth date' do
    let(:valid_birth_date) { DateTime.new(1890, 1, 25) }
      before do
        saint.birth_date = valid_birth_date
      end

      it 'is valid' do
        expect(saint).to be_valid
      end

      it 'may be stored in the database' do
        expect(saint.save).to be_truthy
      end
    end
  end

  describe 'birth accuracy' do
    it { should validate_presence_of(:birth_accuracy).
           with_message('birth accuracy required') }

    context 'a saint with a valid birth accuracy' do
    let(:valid_birth_accuracy) { 3 }
      before do
        saint.birth_accuracy = valid_birth_accuracy
      end

      it 'is valid' do
        expect(saint).to be_valid
      end

      it 'may be stored in the database' do
        expect(saint.save).to be_truthy
      end
    end
  end

  describe 'death date' do
    context 'a saint with a valid death date' do
    let(:valid_death_date) { DateTime.new(1890, 1, 25) }
      before do
        saint.death_date = valid_death_date
      end

      it 'is valid' do
        expect(saint).to be_valid
      end

      it 'may be stored in the database' do
        expect(saint.save).to be_truthy
      end
    end
  end

  describe 'death accuracy' do
    it { should validate_presence_of(:death_accuracy).
           with_message('death accuracy required') }

    context 'a saint with a valid death accuracy' do
    let(:valid_death_accuracy) { 3 }
      before do
        saint.death_accuracy = valid_death_accuracy
      end

      it 'is valid' do
        expect(saint).to be_valid
      end

      it 'may be stored in the database' do
        expect(saint.save).to be_truthy
      end
    end
  end

  describe 'birth location' do
    it { should validate_length_of(:birth_location).is_at_most(255).
           with_message("must be 255 characters or less") }

    context 'a saint with a valid birth location' do
      let(:valid_birth_location) { 'Rome, Italy' }
      before do
        saint.birth_location = valid_birth_location
      end

      it 'is valid' do
        expect(saint).to be_valid
      end

      it 'may be stored in the database' do
        expect(saint.save).to be_truthy
      end
    end

    context 'a saint with an overly long birth location (> 255 chars)' do
      before do
        saint.birth_location = 'a' * 256
      end

      it 'is invalid' do
        expect(saint).not_to be_valid
      end

      it 'may not be stored in the database' do
        expect(saint.save).to be_falsey
      end
    end
  end

  describe 'death location' do
    it { should validate_length_of(:death_location).is_at_most(255).
           with_message("must be 255 characters or less") }

    context 'a saint with a valid death location' do
      let(:valid_death_location) { 'Rome, Italy' }
      before do
        saint.death_location = valid_death_location
      end

      it 'is valid' do
        expect(saint).to be_valid
      end

      it 'may be stored in the database' do
        expect(saint.save).to be_truthy
      end
    end

    context 'a saint with an overly long death location (> 255 chars)' do
      before do
        saint.death_location = 'a' * 256
      end

      it 'is invalid' do
        expect(saint).not_to be_valid
      end

      it 'may not be stored in the database' do
        expect(saint.save).to be_falsey
      end
    end
  end

  describe 'short description' do
    it { should validate_presence_of(:short_description).
           with_message('short description required') }

    context 'a saint with a valid short description' do
      let(:valid_short_description) { 'A holy woman dedicated to God.' }
      before do
        saint.short_description = valid_short_description
      end

      it 'is valid' do
        expect(saint).to be_valid
      end

      it 'may be stored in the database' do
        expect(saint.save).to be_truthy
      end
    end
  end

  describe 'long description' do
    it { should validate_presence_of(:long_description).
           with_message('long description required') }

    context 'a saint with a valid long description' do
      let(:valid_long_description) { 'A holy woman dedicated to God.' }
      before do
        saint.long_description = valid_long_description
      end

      it 'is valid' do
        expect(saint).to be_valid
      end

      it 'may be stored in the database' do
        expect(saint.save).to be_truthy
      end
    end
  end

  describe 'title' do
    it { should validate_presence_of(:title).
           with_message('title required') }

    context 'a saint with a valid title' do
    let(:valid_title) { 3 }
      before do
        saint.title = valid_title
      end

      it 'is valid' do
        expect(saint).to be_valid
      end

      it 'may be stored in the database' do
        expect(saint.save).to be_truthy
      end
    end
  end

  describe 'fame level' do
    it { should validate_presence_of(:fame_level).
           with_message('fame level required') }

    context 'a saint with a valid fame level' do
    let(:valid_fame_level) { 80 }
      before do
        saint.fame_level = valid_fame_level
      end

      it 'is valid' do
        expect(saint).to be_valid
      end

      it 'may be stored in the database' do
        expect(saint.save).to be_truthy
      end
    end
  end

  describe '#has_feast_day?' do
    
    it 'says if saint has a feast day' do
      expect(saint.has_feast_day?).to be_truthy
      saint.feast_day = nil
      expect(saint.has_feast_day?).to be_falsey
    end
  end

  describe '#has_birthday?' do
    
    it 'says if saint has a birthday' do
      expect(saint.has_birthday?).to be_truthy
      saint.birth_date = nil
      expect(saint.has_birthday?).to be_falsey
    end
  end

  describe '#has_birth_location?' do
    
    it 'says if saint has a birth location' do
      expect(saint.has_birth_location?).to be_truthy
      saint.birth_location = nil
      expect(saint.has_birth_location?).to be_falsey
    end
  end

  describe '#has_deathday?' do
    
    it 'says if saint has a deathday' do
      expect(saint.has_deathday?).to be_truthy
      saint.death_date = nil
      expect(saint.has_deathday?).to be_falsey
    end
  end

  describe '#has_death_location?' do
    
    it 'says if saint has a death location' do
      expect(saint.has_death_location?).to be_truthy
      saint.death_location = nil
      expect(saint.has_death_location?).to be_falsey
    end
  end

  describe '#has_beatification_date?' do
    
    it 'says if saint has a beatification date' do
      expect(saint.has_beatification_date?).to be_truthy
      saint.beatification_date = nil
      expect(saint.has_beatification_date?).to be_falsey
    end
  end

  describe '#has_canonization_date?' do
    
    it 'says if saint has a canonization date' do
      expect(saint.has_canonization_date?).to be_truthy
      saint.canonization_date = nil
      expect(saint.has_canonization_date?).to be_falsey
    end
  end

  describe '#accurate_saint_date' do
    
    context 'exact date' do

      it 'provides an exact birth date' do
        saint.birth_accuracy = Saint::EXACT_DATE
        exact_date = saint.birth_date.strftime(Saint::MONTH_DAY_YEAR_FORMAT)
        expect(saint.accurate_saint_date('birth')).to eq(exact_date)
      end

      it 'provides an exact death date' do
        saint.death_accuracy = Saint::EXACT_DATE
        exact_date = saint.death_date.strftime(Saint::MONTH_DAY_YEAR_FORMAT)
        expect(saint.accurate_saint_date('death')).to eq(exact_date)
      end

      it 'provides an exact beatification date' do
        saint.beatification_accuracy = Saint::EXACT_DATE
        exact_date = saint.beatification_date.strftime(Saint::MONTH_DAY_YEAR_FORMAT)
        expect(saint.accurate_saint_date('beatification')).to eq(exact_date)
      end

      it 'provides an exact canonization date' do
        saint.canonization_accuracy = Saint::EXACT_DATE
        exact_date = saint.canonization_date.strftime(Saint::MONTH_DAY_YEAR_FORMAT)
        expect(saint.accurate_saint_date('canonization')).to eq(exact_date)
      end
    end

    context 'exact month and year' do

      it 'provides an exact birth month and year' do
        saint.birth_accuracy = Saint::EXACT_MONTH_YEAR
        exact_month_year = saint.birth_date.strftime(Saint::MONTH_YEAR_FORMAT)
        expect(saint.accurate_saint_date('birth')).to eq(exact_month_year)
      end

      it 'provides an exact death month and year' do
        saint.death_accuracy = Saint::EXACT_MONTH_YEAR
        exact_month_year = saint.death_date.strftime(Saint::MONTH_YEAR_FORMAT)
        expect(saint.accurate_saint_date('death')).to eq(exact_month_year)
      end

      it 'provides an exact beatification month and year' do
        saint.beatification_accuracy = Saint::EXACT_MONTH_YEAR
        exact_month_year = saint.beatification_date.strftime(Saint::MONTH_YEAR_FORMAT)
        expect(saint.accurate_saint_date('beatification')).to eq(exact_month_year)
      end

      it 'provides an exact canonization month and year' do
        saint.canonization_accuracy = Saint::EXACT_MONTH_YEAR
        exact_month_year = saint.canonization_date.strftime(Saint::MONTH_YEAR_FORMAT)
        expect(saint.accurate_saint_date('canonization')).to eq(exact_month_year)
      end
    end

    context 'exact year' do

      it 'provides an exact birth year' do
        saint.birth_accuracy = Saint::EXACT_YEAR
        exact_year = saint.birth_date.strftime(Saint::YEAR_FORMAT)
        expect(saint.accurate_saint_date('birth')).to eq(exact_year)
      end

      it 'provides an exact death year' do
        saint.death_accuracy = Saint::EXACT_YEAR
        exact_year = saint.death_date.strftime(Saint::YEAR_FORMAT)
        expect(saint.accurate_saint_date('death')).to eq(exact_year)
      end

      it 'provides an exact beatification year' do
        saint.beatification_accuracy = Saint::EXACT_YEAR
        exact_year = saint.beatification_date.strftime(Saint::YEAR_FORMAT)
        expect(saint.accurate_saint_date('beatification')).to eq(exact_year)
      end

      it 'provides an exact canonization year' do
        saint.canonization_accuracy = Saint::EXACT_YEAR
        exact_year = saint.canonization_date.strftime(Saint::YEAR_FORMAT)
        expect(saint.accurate_saint_date('canonization')).to eq(exact_year)
      end
    end

    context 'approximate year' do

      it 'provides an approximate birth year' do
        saint.birth_accuracy = Saint::APPROX_YEAR
        approximate_year = saint.birth_date.
                             strftime('c. ' + Saint::YEAR_FORMAT)
        expect(saint.accurate_saint_date('birth')).to eq(approximate_year)
      end

      it 'provides an approximate death year' do
        saint.death_accuracy = Saint::APPROX_YEAR
        approximate_year = saint.death_date.
                             strftime('c. ' + Saint::YEAR_FORMAT)
        expect(saint.accurate_saint_date('death')).to eq(approximate_year)
      end

      it 'provides an approximate beatification year' do
        saint.beatification_accuracy = Saint::APPROX_YEAR
        approximate_year = saint.beatification_date.
                             strftime('c. ' + Saint::YEAR_FORMAT)
        expect(saint.accurate_saint_date('beatification')).to eq(approximate_year)
      end

      it 'provides an approximate canonization year' do
        saint.canonization_accuracy = Saint::APPROX_YEAR
        approximate_year = saint.canonization_date.
                             strftime('c. ' + Saint::YEAR_FORMAT)
        expect(saint.accurate_saint_date('canonization')).to eq(approximate_year)
      end
    end
  end
end
