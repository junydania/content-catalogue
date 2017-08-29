require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'DB table Category' do
    it { is_expected.to have_db_column :category_name }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of :category_name }
  end

end
