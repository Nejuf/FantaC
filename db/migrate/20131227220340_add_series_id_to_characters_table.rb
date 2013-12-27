class AddSeriesIdToCharactersTable < ActiveRecord::Migration
  def change
  	add_column :characters, :series_id, :integer
  	add_index :characters, :series_id
  end
end
