class CreatePositions < ActiveRecord::Migration
  def change
    create_table :positions do |t|
      t.string :name, null: false, default: ""

      t.timestamps
    end

    add_index :positions, :name, unique: true
  end
end
