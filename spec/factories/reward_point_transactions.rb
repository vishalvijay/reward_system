require 'faker'
FactoryGirl.define do
  factory :reward_point_transaction do
    association :user
    title { Faker::Hipster.sentence(3) }
    points { coupon ? -coupon.points : Faker::Number.between(-1000, 1000) }
    factory :reward_point_transaction_with_coupon do
      association :coupon
    end
  end
end
