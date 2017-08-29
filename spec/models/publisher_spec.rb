require 'rails_helper'

RSpec.describe Publisher, type: :model do
  describe 'DB table Publisher' do
    it { is_expected.to have_db_column :publisher_name }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of :publisher_name }
  end

end