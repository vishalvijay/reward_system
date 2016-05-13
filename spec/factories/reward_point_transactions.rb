require 'faker'
FactoryGirl.define do
  factory :reward_point_transaction do
    association :user
    # association :reward
    title { Faker::Hipster.sentence(3) }
    points { reward ? -reward.points : Faker::Number.between(-1000, 1000) }
  end
end
