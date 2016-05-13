require 'rails_helper'

RSpec.describe User, type: :model do
  it "has a valid factory" do
    expect(build(:user)).to be_valid
  end

  #All other fields will be validated by devise, so we no need test it
  it { is_expected.to validate_presence_of :name }

  context "user_with_points" do
    it "has points grater than 0" do
      user = create(:user_with_points)
      expect(user.points).to be > 0
    end

    it "can redeem coupon of same points" do
      user = create(:user_with_points)
      reward = create(:reward, points: user.points)
      expect(user.redeem(reward)).to eq nil
    end
    it "can redeem coupon of lesser points" do
      user = create(:user_with_points)
      reward = create(:reward, points: user.points-1)
      expect(user.redeem(reward)).to eq nil
    end
    it "can't redeem coupon of grater points" do
      user = create(:user_with_points)
      reward = create(:reward, points: user.points+1)
      expect(user.redeem(reward)).to eq "You don't have enouph points to redeem this coupon"
    end
  end

  context "user_with_negative_points" do
    it "has points less than 0" do
      user = create(:user_with_negative_points)
      expect(user.points).to be < 0
    end
  end
end
