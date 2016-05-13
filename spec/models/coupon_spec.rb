require 'rails_helper'

RSpec.describe Coupon, type: :model do

  it "has a valid factory" do
    expect(build(:coupon)).to be_valid
  end

  subject { create(:coupon) }

  describe "validations" do
    it { should belong_to(:user) }
    it { should belong_to(:reward) }
    it { is_expected.to validate_presence_of :expires_at }
    it { is_expected.to validate_presence_of :points }
    it { is_expected.to validate_presence_of :reward }
    it { is_expected.to validate_presence_of :user }
    it { should validate_uniqueness_of(:code) }

    it "has none empty code" do
      expect(subject.code.blank?).to eq false
    end

    it "has a reward_point_transaction" do
      expect(subject.reward_point_transaction.present?).to eq true
    end
  end

  it "has title method and it return same value as code" do
    expect(subject.title).to eq subject.code
  end

  it "new_code will return string of length 8" do
    expect(Coupon.new_code.length).to eq 8
  end

  it "reward_point_transaction will get deleted when coupon is deleted" do
    reward_point_transaction = subject.reward_point_transaction
    subject.destroy
    expect(reward_point_transaction.destroyed?).to eq true
  end

  it "reward_point_transaction has -ve value of coupon points" do
    expect(-subject.reward_point_transaction.points).to eq subject.points
  end
end
