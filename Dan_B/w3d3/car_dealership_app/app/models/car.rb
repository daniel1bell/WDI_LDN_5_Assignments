class Car < ActiveRecord::Base
  attr_accessible :colour, :fuel, :fuel_economy, :gearbox, :image, :make, :mileage, :model, :notes, :number_doors, :number_seats, :price, :reg_year
end
