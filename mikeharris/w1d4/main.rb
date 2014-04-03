require 'pry'

require_relative 'person'
require_relative 'flat' 
require_relative 'building'

b=Building.new('w1n 4hr')
b.affluency = :minted

f1 = Flat.new('Reeves',750, 4, 2)
f2 = Flat.new('9 Back hill', 5000, 12, 4)
f3 = Flat.new('The Bowler',1000,5,2)


[f1,f2,f3].each do |flat|
  b.flats[flat.name] = flat
end


binding.pry

