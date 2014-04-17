class Engine < ActiveRecord::Base
  attr_accessible :engine_size, :fuel_type, :power

  has_many :cars

def value_for_select
  "#{id} | #{engine_size} cc, #{fuel_type}, #{power} BHP"
end

end
