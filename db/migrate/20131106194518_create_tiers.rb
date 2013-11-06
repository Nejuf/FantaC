class CreateTiers < ActiveRecord::Migration
  def change
    create_table :tiers do |t|
      t.string :name, null: false, default: ""

      t.timestamps
    end

    add_index :tiers, :name, unique: true
  end
end
