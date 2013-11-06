class CreateCharacterEntries < ActiveRecord::Migration
  def change
    create_table :character_entries do |t|
      t.integer :character_id, null: false
      t.integer :entry_id, null: false
      t.integer :position_id, null: false

      t.timestamps
    end

    add_index :character_entries, :character_id
    add_index :character_entries, :entry_id
    add_index :character_entries, :position_id
    add_index :character_entries, [:entry_id, :character_id], unique: true
    add_index :character_entries, [:entry_id, :position_id], unique: true
  end
end
