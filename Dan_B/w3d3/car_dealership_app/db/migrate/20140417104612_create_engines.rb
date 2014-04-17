class CreateEngines < ActiveRecord::Migration
  def change
    create_table :engines do |t|
      t.integer :engine_size
      t.string :fuel_type
      t.integer :power

      t.timestamps
    end
  end
end
