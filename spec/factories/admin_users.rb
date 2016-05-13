require 'faker'
FactoryGirl.define do
  password = Faker::Internet.password
  factory :admin_user do
    email { Faker::Internet.email }
    password password
    password_confirmation password
  end
end
