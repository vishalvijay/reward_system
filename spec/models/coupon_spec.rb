require 'rails_helper'

RSpec.describe Coupon, type: :model do
  it { should belong_to(:user) }
  # it { is_expected.to validate_uniqueness_of(:code) }
end
