FactoryGirl.define do
  factory :coupon do
    user nil
    reward nil
    expires_at "2016-05-12 20:42:36"
    points 1
    code "MyString"
  end
end
