require 'rails_helper'

RSpec.describe Video, type: :model do
  describe 'DB table Video' do
    it { is_expected.to have_db_column :id }
    it { is_expected.to have_db_column :title }
    it { is_expected.to have_db_column :description }
    it { is_expected.to have_db_column :video_image }
    it { is_expected.to have_db_column :release_date }
    it { is_expected.to have_db_column :video_storage_path }
  end

end


