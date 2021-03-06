class CreateBattles < ActiveRecord::Migration
  def change
    create_table :battles do |t|
      t.string :name, null: false, default: ""
      t.text :desc, null: false, default: ""
      t.string :start_date, null: false
      t.string :end_date, null: false
      t.integer :user_id

      t.timestamps
    end

    add_index :battles, :name
    add_index :battles, :start_date
    add_index :battles, :end_date
  end
end
