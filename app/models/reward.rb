class Reward < ActiveRecord::Base
  validates_presence_of :name, :points, :background_color, :font_color
  has_many :coupons

  searchable do
    text :name
    text :description
    integer :points
  end

end

