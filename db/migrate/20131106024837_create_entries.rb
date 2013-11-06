class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :name, default: ""
      t.text :desc, default: ""
      t.integer :user_id, null: false
      t.integer :contest_id, null: false

      t.timestamps
    end

    add_index :entries, :user_id
    add_index :entries, :contest_id
    add_index :entries, [:user_id, :contest_id], unique: true
  end
end
