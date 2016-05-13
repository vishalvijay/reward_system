require 'rails_helper'
require 'ostruct'

RSpec.describe User, type: :model do
  it "has a valid factory" do
    expect(build(:user)).to be_valid
  end

  describe "validations" do
    #All other fields will be validated by devise, so we no need test it
    it { is_expected.to validate_presence_of :name }
  end

  context "reward_point_transactions" do
    it { should have_many(:reward_point_transactions) }

    it "return in descending" do
      user = create(:user)
      user.reward_point_transactions << create(:reward_point_transaction)
      last_one = create(:reward_point_transaction)
      user.reward_point_transactions << last_one
      expect(user.reward_point_transactions.first).to eq last_one
    end
  end

  context "coupons" do
    it { should have_many(:coupons) }

    it "return coupons in descending" do
      user = create(:user)
      user.coupons << create(:coupon)
      last_one = create(:coupon)
      user.coupons << last_one
      expect(user.coupons.first).to eq last_one
    end
  end

  it "create new if not exist when find with from_omniauth" do
    user = build(:user)
    existing_user = User.find_by_email(user.email)
    new_user = User.from_omniauth(OpenStruct.new({
        info: OpenStruct.new({
          email: user.email,
          name: user.name,
          image_url: user.image_url
        })
      }
    ))
    expect(new_user).not_to eq nil
  end

  it "won't create new if already exist when find with from_omniauth" do
    user = create(:user)
    new_user = User.from_omniauth(OpenStruct.new({
        info: OpenStruct.new({
          email: user.email,
          name: user.name,
          image_url: user.image_url
        })
      }
    ))
    expect(new_user).to eq user
  end

  it "has 'points' attribute included in as_json" do
    user = create(:user)
    expect(user.as_json["points"]).not_to eq nil
  end

  it "can't redeem a nil reward" do
    user = create(:user)
    expect(user.redeem(nil)).to eq I18n.t("user_redeem_errors.nil_reward")
  end

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
      expect(user.redeem(reward)).to eq I18n.t("user_redeem_errors.not_enough_points")
    end
  end

  context "user_with_negative_points" do
    it "has points less than 0" do
      user = create(:user_with_negative_points)
      expect(user.points).to be < 0
    end
  end
end
