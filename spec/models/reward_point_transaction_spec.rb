require 'rails_helper'

RSpec.describe RewardPointTransaction, type: :model do

  it "has a valid factory" do
    expect(build(:reward_point_transaction)).to be_valid
  end

  subject { create(:reward_point_transaction) }

  describe "validations" do
    it { should belong_to(:user) }
    it { is_expected.to validate_presence_of :title }
    it { is_expected.to validate_presence_of :points }
    context "with coupon" do
      subject { create(:coupon_reward_point_transaction) }
      it { should belong_to(:coupon) }
    end
  end
end
