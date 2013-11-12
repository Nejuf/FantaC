class AddsPortraitImageToPortraits < ActiveRecord::Migration
  def change
    add_attachment :portraits, :portrait_image
  end
end
