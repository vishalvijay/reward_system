require 'faker'
FactoryGirl.define do
  factory :coupon do
    association :user
    association :reward
    expires_at 1.month.from_now
    points { reward.points }
  end
end
