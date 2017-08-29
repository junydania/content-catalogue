require 'rails_helper'

RSpec.describe Comedian, type: :model do
  describe 'DB table Comedian' do
    it { is_expected.to have_db_column :name }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of :name }
  end

end
