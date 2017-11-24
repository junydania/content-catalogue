require 'rails_helper'


RSpec.describe User, type: :model do

  describe 'DB table User' do
    it { is_expected.to have_db_column :id }
    it { is_expected.to have_db_column :email }
    it { is_expected.to have_db_column :first_name }
    it { is_expected.to have_db_column :last_name }
    it { is_expected.to have_db_column :encrypted_password }
    it { is_expected.to have_db_column :role }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of :email }
    it { is_expected.to validate_presence_of :encrypted_password }
  end

  describe 'User' do
    it 'has a valid factory' do
      expect(create(:user)).to be_valid
    end
  end

end


