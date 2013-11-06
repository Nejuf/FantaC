class CreateContestPositions < ActiveRecord::Migration
  def change
    create_table :contest_positions do |t|
      t.integer :contest_id, null: false
      t.integer :position_id, null: false

      t.timestamps
    end
    add_index :contest_positions, :contest_id
    add_index :contest_positions, :position_id
    add_index :contest_positions, [:contest_id, :position_id], unique: true
  end
end
