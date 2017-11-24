require 'rails_helper'
require 'cancan/matchers'
require_relative '../../app/models/ability.rb'


RSpec.describe Ability, type: :model do

  describe 'User Ability' do
    describe "abilities" do

      before(:example) do
        @video = FactoryGirl.create(:video)
        @publisher = FactoryGirl.create(:publisher)
        @category = FactoryGirl.create(:category)
        @comedian = FactoryGirl.create(:comedian)
      end

      subject(:ability) { Ability.new(user) }
      let (:user) { nil }

      context "when user is an administrator" do
        let(:user){ FactoryGirl.create(:administrator) }
        it { should be_able_to(:update, @video)}
        it { should be_able_to(:delete, @video)}
      end

      context "when is a standard user" do
        let(:user){ FactoryGirl.create(:standard) }
        it { should be_able_to(:update, @video)}
        it { should be_able_to(:create, @video)}
        it { should be_able_to(:read, @video)}
        it { should_not be_able_to(:delete, @video)}
        it { should be_able_to(:read, @publisher)}
      end

      context "when is a guest user" do
        let(:user){ FactoryGirl.create(:guest) }
        it { should_not be_able_to(:update, @video)}
        it { should_not be_able_to(:delete, @video)}
        it { should be_able_to(:read, @video)}
        it { should be_able_to(:read, @publisher)}
        it { should be_able_to(:read, @category)}
        it { should be_able_to(:read, @comedian)}
      end
    end
  end
end







