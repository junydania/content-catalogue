require 'rails_helper'
require 'cancan/matchers'
require_relative '../../app/models/ability.rb'


RSpec.describe Ability, type: :model do

  describe 'User Ability' do
    describe "abilities" do
      subject(:ability) { Ability.new(user) }
      let (:user) { nil }

      context "when user is an administrator" do
        let(:user){ FactoryGirl.create(:administrator) }
        it { should be_able_to(:update, FactoryGirl.create(:video))}
        it { should be_able_to(:delete, FactoryGirl.create(:video))}
      end

      context "when is a standard user" do
        let(:user){ FactoryGirl.create(:standard) }
        it { should be_able_to(:update, FactoryGirl.create(:video))}
        it { should be_able_to(:create, FactoryGirl.create(:video))}
        it { should be_able_to(:read, FactoryGirl.create(:video))}
        it { should_not be_able_to(:delete, FactoryGirl.create(:video))}
      end

      context "when is a guest user" do
        let(:user){ FactoryGirl.create(:guest) }
        it { should_not be_able_to(:update, FactoryGirl.create(:video))}
        it { should_not be_able_to(:delete, FactoryGirl.create(:video))}
      end



    end
  end
end




