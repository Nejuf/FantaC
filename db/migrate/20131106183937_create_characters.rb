class CreateCharacters < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.string :name, null: false, default: ""
      t.text :desc, null: false, default: ""
      t.integer :user_id
      t.integer :affinity_id, null: false, default: 0
      t.integer :tier_id, null: false, default: 0
      t.integer :stat_hp, null: false, default: 0
      t.integer :stat_str, null: false, default: 0
      t.integer :stat_def, null: false, default: 0
      t.integer :stat_spd, null: false, default: 0

      t.timestamps
    end

    add_index :characters, :name
    add_index :characters, :user_id
    add_index :characters, :affinity_id
    add_index :characters, :tier_id
    add_index :characters, :stat_hp
    add_index :characters, :stat_str
    add_index :characters, :stat_def
    add_index :characters, :stat_spd
  end
end
