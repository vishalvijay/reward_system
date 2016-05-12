class AddCouponIdToRewardPointTransactions < ActiveRecord::Migration
  def change
    add_reference :reward_point_transactions, :coupon, index: true, foreign_key: true
  end
end
