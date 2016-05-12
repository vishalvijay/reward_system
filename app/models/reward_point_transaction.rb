class RewardPointTransaction < ActiveRecord::Base
  belongs_to :user
  belongs_to :coupon
  validates_presence_of :title, :points, :user
end
