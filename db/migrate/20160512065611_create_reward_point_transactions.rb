class CreateRewardPointTransactions < ActiveRecord::Migration
  def change
    create_table :reward_point_transactions do |t|
      t.string :title, null: false
      t.integer :points, null: false
      t.references :user, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end
