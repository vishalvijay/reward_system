require 'faker'
FactoryGirl.define do
  password = Faker::Internet.password
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    image_url { Faker::Avatar.image("my-own-slug", "200x200") }
    password password
    password_confirmation password

    factory :user_with_points do
      transient do
        reward_point_transactions_count 1
      end

      after(:create) do |user, evaluator|
        create_list(:reward_point_transaction, evaluator.reward_point_transactions_count, user: user, points: 1000)
      end
    end

    factory :user_with_negative_points do
      transient do
        reward_point_transactions_count 1
      end

      after(:create) do |user, evaluator|
        create_list(:reward_point_transaction, evaluator.reward_point_transactions_count, user: user, points: -1000)
      end
    end
  end
end
