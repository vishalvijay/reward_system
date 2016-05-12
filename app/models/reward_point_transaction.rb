class RewardPointTransaction < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :title, :points, :user
end
