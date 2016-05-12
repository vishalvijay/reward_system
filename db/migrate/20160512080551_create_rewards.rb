class CreateRewards < ActiveRecord::Migration
  def change
    create_table :rewards do |t|
      t.string :name, null: false, index: true
      t.integer :points, null: false
      t.string :background_color, null: false
      t.string :font_color, null: false

      t.timestamps null: false
    end
  end
end
