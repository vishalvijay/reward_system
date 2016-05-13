require 'rails_helper'

RSpec.describe Reward, type: :model do
  it "has a valid factory" do
    expect(build(:reward)).to be_valid
  end

  it { is_expected.to validate_presence_of :name }
  it { is_expected.to validate_presence_of :points }
  it { is_expected.to validate_presence_of :background_color }
  it { is_expected.to validate_presence_of :font_color }
end
