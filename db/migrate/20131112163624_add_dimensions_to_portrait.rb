class AddDimensionsToPortrait < ActiveRecord::Migration
  def change
    add_column :portraits, :image_width, :integer
    add_column :portraits, :image_height, :integer
  end
end
