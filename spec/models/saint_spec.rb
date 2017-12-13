require 'rails_helper'

RSpec.describe Saint, type: :model do
  context "db" do
    context "indexes" do
      it { should have_db_index(:slug).unique(true) }
    end

    context "columns" do
      it { should have_db_column(:name).of_type(:string) }
      it { should have_db_column(:gender).of_type(:string) }
      it { should have_db_column(:feast_day).of_type(:date) }
      it { should have_db_column(:birth_date).of_type(:datetime) }
      it { should have_db_column(:birth_accuracy).of_type(:integer) }
      it { should have_db_column(:death_date).of_type(:datetime) }
      it { should have_db_column(:death_accuracy).of_type(:integer) }
      it { should have_db_column(:birth_location).of_type(:string) }
      it { should have_db_column(:death_location).of_type(:string) }
      it { should have_db_column(:beatification_date).of_type(:datetime) }
      it { should have_db_column(:canonization_date).of_type(:datetime) }
      it { should have_db_column(:pope).of_type(:boolean).with_options(default: false) }
      it { should have_db_column(:cardinal).of_type(:boolean).with_options(default: false) }
      it { should have_db_column(:bishop).of_type(:boolean).with_options(default: false) }
      it { should have_db_column(:priest).of_type(:boolean).with_options(default: false) }
      it { should have_db_column(:religious).of_type(:boolean).with_options(default: false) }
      it { should have_db_column(:lay).of_type(:boolean).with_options(default: false) }
      it { should have_db_column(:martyr).of_type(:boolean).with_options(default: false) }
      it { should have_db_column(:founder).of_type(:boolean).with_options(default: false) }
      it { should have_db_column(:mystic).of_type(:boolean).with_options(default: false) }
      it { should have_db_column(:doctor_of_the_church).of_type(:boolean).with_options(default: false) }
      it { should have_db_column(:early_church_father).of_type(:boolean).with_options(default: false) }
      it { should have_db_column(:created_at).of_type(:datetime).with_options(null: false) }
      it { should have_db_column(:updated_at).of_type(:datetime).with_options(null: false) }
      it { should have_db_column(:birth_latitude).of_type(:float) }
      it { should have_db_column(:birth_longitude).of_type(:float) }
      it { should have_db_column(:death_latitude).of_type(:float) }
      it { should have_db_column(:death_longitude).of_type(:float) }
      it { should have_db_column(:slug).of_type(:string) }
      it { should have_db_column(:beatification_accuracy).of_type(:integer) }
      it { should have_db_column(:canonization_accuracy).of_type(:integer) }
      it { should have_db_column(:royalty).of_type(:boolean).with_options(default: false) }
      it { should have_db_column(:short_description).of_type(:text) }
      it { should have_db_column(:long_description).of_type(:text) }
      it { should have_db_column(:avatar).of_type(:string) }
      it { should have_db_column(:avatar_caption).of_type(:string) }
      it { should have_db_column(:avatar_description).of_type(:string) }
      it { should have_db_column(:avatar_alternative_text).of_type(:string) }
      it { should have_db_column(:title).of_type(:integer) }
      it { should have_db_column(:fame_level).of_type(:integer) }
      it { should have_db_column(:published).of_type(:boolean).with_options(default: false) }
    end
  end

  it { should have_many(:active_relationships).dependent(:destroy) }
  it { should have_many(:passive_relationships).dependent(:destroy) }
  it { should have_many(:following).through(:active_relationships) }
  it { should have_many(:followers).through(:passive_relationships) }
  it { should have_many(:written_works).dependent(:destroy) }
  it { should have_many(:timeline_events).dependent(:destroy) }
  it { should have_many(:saint_photos).dependent(:destroy) }

  context "validation" do
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
    	should validate_presence_of(:title).
    		with_message('title required')
    end

    it do
    	should validate_presence_of(:fame_level).
    		with_message('fame level required')
    end
  end
end
