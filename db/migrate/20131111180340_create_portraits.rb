class CreatePortraits < ActiveRecord::Migration
  def change
    create_table :portraits do |t|
      t.integer :focusX, default: 0
      t.integer :focusY, default: 0
      t.integer :character_id

      t.timestamps
    end

    add_index :portraits, :character_id
  end
end
