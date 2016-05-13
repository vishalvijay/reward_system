require 'rails_helper'

RSpec.describe RewardPointTransaction, type: :model do
  it { should belong_to(:user) }
end
