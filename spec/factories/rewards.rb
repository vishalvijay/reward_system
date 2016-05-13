require 'faker'
FactoryGirl.define do
  factory :reward do
    name { Faker::App.name }
    points { Faker::Number.between(1, 1000) }
    background_color { Faker::Color.hex_color }
    font_color { Faker::Color.hex_color }
    description { Faker::Lorem.paragraph }
  end
end
