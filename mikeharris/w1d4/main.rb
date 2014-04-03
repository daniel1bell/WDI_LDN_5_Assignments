require 'pry'

require_relative 'person'
require_relative 'flat' 
require_relative 'building'

b=Building.new
b.post_code = 'w1n 4hr'
b.affluency = :minted
b.flats= []

f1 = Flat.new
f1.name = 'Reeves'
f1.price =750
f1.bedrooms =4
f1.bathrooms=2
f1.tenants = []

f2 = Flat.new
f2.name = '9 Back hill'
f2.price = 5000
f2.bedrooms = 12
f2.bathrooms= 4
f2.tenants = []

f3 = Flat.new
f3.name = 'The Bowler'
f3.price = 1000
f3.bedrooms = 5
f3.bathrooms= 2
f3.tenants = []

binding.pry

