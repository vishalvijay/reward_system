class Reward < ActiveRecord::Base
  validates_presence_of :name, :points, :background_color, :font_color

  searchable do
    text :name
    text :description
  end
end
