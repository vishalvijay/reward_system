class CreateCoupons < ActiveRecord::Migration
  def change
    create_table :coupons do |t|
      t.references :user, index: true, foreign_key: true, null: false
      t.references :reward, index: true, foreign_key: true, null: false
      t.datetime :expires_at, null: false, index: true
      t.integer :points, null: false
      t.string :code, null: false

      t.timestamps null: false
    end
    add_index :coupons, :code, unique: true
  end
end
