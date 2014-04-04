require 'pry'

# load files
require_relative 'person'
require_relative 'flat'
require_relative 'building'
require_relative 'menu'


# setup initial data
b = Building.new('w1n 4hr')
b.affluency = :minted 


f1 = Flat.new('Reeves', 750, 4, 2)

f2 = Flat.new('9 Back Hill', 5000, 12, 4)

f3 = Flat.new('The Bowler', 1000, 5, 2)

[f1, f2, f3].each do |flat|
  b.flats[flat.name] = flat
end

p1 = Person.new('Louie', '911')
p2 = Person.new('Mike', '999')
p3 = Person.new('Sarah', '111')

f1.tenants[p1.name] = p1
f2.tenants[p2.name] = p2
f2.tenants[p3.name] = p3

prospect_name = 'Julien'
prospect_phone = '333'

b.prospects[prospect_name] = Person.new(prospect_name, prospect_phone)


# binding.pry

#run command line interaction


response = menu.downcase
while response != "q"

  case response
  when 1.to_s
  puts b.list_flats 
  when 2.to_s
  puts b.list_prospects 
  when 3.to_s
  let_flat(b) 
  when 4.to_s
  b.evict_tenant 
  when 5.to_s
  puts b.list_empty_flats
  when 6.to_s
  b.list_tenants
  when 7.to_s
  puts b.create_prospect 
  else
  puts "invalid menu choice - press enter and try again"
  end
  gets

response = menu

end





binding.pry