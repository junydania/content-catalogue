require 'rails_helper'

RSpec.describe Video, type: :model do
  describe 'DB table Video' do
    it { is_expected.to have_db_column :id }
    it { is_expected.to have_db_column :title }
    it { is_expected.to have_db_column :description }
    it { is_expected.to have_db_column :release_date }
    it { is_expected.to have_db_column :video_storage_path }
    it { is_expected.to have_db_column :comedian_id }
    it { is_expected.to have_db_column :publisher_id }
    it { is_expected.to have_db_column :category_id }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of :title }
    it { is_expected.to validate_presence_of :description }
    it { is_expected.to validate_presence_of :video_storage_path }
    it { is_expected.to validate_presence_of :comedian_id }
    it { is_expected.to validate_presence_of :publisher_id }
    it { is_expected.to validate_presence_of :category_id }
  end

  describe 'Video' do
    it 'has a valid factory' do
      expect(create(:video)).to be_valid
    end
  end


end


