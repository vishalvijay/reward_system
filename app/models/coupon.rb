class Coupon < ActiveRecord::Base
  belongs_to :user
  belongs_to :reward
  validates_presence_of :expires_at, :points, :code, :reward, :user
  validates_uniqueness_of :code

  def title
    code
  end
end
