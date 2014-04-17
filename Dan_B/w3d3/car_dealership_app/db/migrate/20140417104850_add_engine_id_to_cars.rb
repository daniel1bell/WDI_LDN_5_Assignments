class AddEngineIdToCars < ActiveRecord::Migration
  def change
    add_column :cars, :engine_id, :integer
  end
end
