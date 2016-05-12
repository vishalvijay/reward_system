class Coupon < ActiveRecord::Base
  extend CommonUtils
  belongs_to :user
  belongs_to :reward
  has_one :reward_point_transaction, dependent: :destroy
  validates_presence_of :expires_at, :points, :code, :reward, :user, :reward_point_transaction
  validates_uniqueness_of :code

  before_validation do
    self.code = self.class.new_code if self.code.blank?
    unless reward_point_transaction
      self.reward_point_transaction = RewardPointTransaction.new(user: user, title: "Redeemed #{self.points} points for #{reward.name} coupon", points: -self.points)
    end
  end

  def title
    code
  end

  def self.new_code
    generate_unique_code size: 8, charset: [(0..9),('A'..'Z')].map{|i| i.to_a}.flatten
  end
end
