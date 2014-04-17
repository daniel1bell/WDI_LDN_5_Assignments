class RemoveFuelFromCars < ActiveRecord::Migration
  def up
    remove_column :cars, :fuel
  end

  def down
    add_column :cars, :fuel, :string
  end
end
