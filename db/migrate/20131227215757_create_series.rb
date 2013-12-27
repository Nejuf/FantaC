class CreateSeries < ActiveRecord::Migration
  def change
    create_table :series do |t|
      t.string :name, null: false, default: ""
      t.integer :affinity_id
      t.text :desc

      t.timestamps
    end

    add_index :series, :name
    add_index :series, :affinity_id
  end
end
