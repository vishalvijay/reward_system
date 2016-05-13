class RewardPointTransaction < ActiveRecord::Base
  belongs_to :user
  #TODO handle rails recursive dependent delete issue
  belongs_to :coupon
  validates_presence_of :title, :points, :user
end
