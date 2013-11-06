class CreateBattleRosters < ActiveRecord::Migration
  def change
    create_table :battle_rosters do |t|
      t.integer :battle_id, null: false
      t.integer :character_id, null: false
      t.integer :character_points, defaults: 0

      t.timestamps
    end

    add_index :battle_rosters, :battle_id
    add_index :battle_rosters, :character_id
    add_index :battle_rosters, [:battle_id, :character_id], unique: true
    add_index :battle_rosters, :character_points
  end
end
