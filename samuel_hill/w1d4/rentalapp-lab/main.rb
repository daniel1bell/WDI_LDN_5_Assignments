require 'pry'

require_relative 'person'
require_relative 'flat'
require_relative 'building'
require_relative 'menu'

b = Building.new('W1N 4HR')
b.affluency = :minted

f1 = Flat.new('The Oaks',750,4,2)
f2 = Flat.new('9 Back Hill',5000,12,4)
f3 = Flat.new('The Bowler',1000,5,2)
f4 = Flat.new('Pinewood',1500,4,10)

[f1,f2,f3,f4].each do |flat|
	b.flats[flat.name] = flat
end

p1 = Person.new('Louie', '911')
p2 = Person.new('Mike', '999')
p3 = Person.new('Sarah', '111')
p4 = Person.new('Julien', '333')

f1.tenants[p1.name] = p1
f2.tenants[p2.name] = p2
f3.tenants[p3.name] = p3

b.prospects[p4.name] = p4

binding.pry

# run command line interaction

response = menu.downcase
while response != '8'

	case response
		when '1'
			puts b.list_flats
		when '2'
			puts b.list_prospects 
		when '3'
			puts let_flat(b) 
		when '4'
			b.evict_tenant
		when '5'
			puts b.list_empty_flats
		when '6'
			b.list_all_tenants
		when '7'
			b.create_prospect		
		else
			puts "Invalid menu choice. Press Enter and please try again."
	end
	gets

response = menu

end
















binding.pry