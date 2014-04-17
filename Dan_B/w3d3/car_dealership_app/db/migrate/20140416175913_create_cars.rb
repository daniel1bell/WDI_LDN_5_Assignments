class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.string :make
      t.string :model
      t.date :reg_year
      t.decimal :price
      t.integer :mileage
      t.string :colour
      t.string :gearbox
      t.string :fuel
      t.integer :fuel_economy
      t.text :image
      t.integer :number_doors
      t.integer :number_seats
      t.text :notes

      t.timestamps
    end
  end
end
