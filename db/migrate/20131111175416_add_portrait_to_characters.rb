class AddPortraitToCharacters < ActiveRecord::Migration
  def change
    add_attachment :characters, :portrait
  end
end
