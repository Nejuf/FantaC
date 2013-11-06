class CreateAffinities < ActiveRecord::Migration
  def change
    create_table :affinities do |t|
      t.string :name, null: false, default: ""

      t.timestamps
    end

    add_index :affinities, :name, unique: true
  end
end
