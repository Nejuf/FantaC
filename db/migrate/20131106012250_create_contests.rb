class CreateContests < ActiveRecord::Migration
  def change
    create_table :contests do |t|
      t.string :name, null: false, default: ""
      t.text :desc, null: false, default: ""
      t.integer :points_cap, null: false, default: 0
      t.integer :entry_fee, null: false, default: 0
      t.integer :payout_type_id, null: false
      t.integer :payout_amount
      t.integer :category_id
      t.integer :user_id
      t.integer :battle_id, null: false

      t.timestamps
    end

    add_index :contests, :user_id
    add_index :contests, :category_id
    add_index :contests, :battle_id
    add_index :contests, :name
    add_index :contests, :entry_fee
    add_index :contests, :payout_type_id
    add_index :contests, :payout_amount
  end
end
