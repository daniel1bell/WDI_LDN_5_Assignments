
# load files
require 'pry'
require_relative 'person'
require_relative 'flat'
require_relative 'building'
require_relative 'menu'

# set up data

b = Building.new('w1n 4hr')
b.affluency = :minted 

f1 = Flat.new('Reeves', 750, 4, 2)

f2 = Flat.new('9 Back Hill', 5000, 12, 4)

f3 = Flat.new('The Bowler', 1000, 5, 2)

[f1, f2, f3].each do |flat|
  b.flats[flat.name] = flat
end

people = [ ]

people << Person.new('Louie', '911')
people << Person.new('Mike', '999')
people << Person.new('Sarah', '111')
people << Person.new('Julien', '333')

f1.tenants[people[0].name] = people[0]
f1.tenants[people[1].name] = people[1]
f2.tenants[people[2].name] = people[2]

b.prospects[people[3].name] = people[3]

# binding.pry

# run command line interaction

response = menu.downcase
while response != 'q'
case response
  when '1'
    puts b.list_flats 
    puts "Hit enter to return to main menu."
  when '2'
    puts b.list_prospects
    puts "Hit enter to return to main menu."
  when '3'
    let_flat(b) 

  when '4' 
    evict_tenant(b)
  
  when '5' 
    puts b.list_empty_flats
    puts "Hit enter to return to main menu."

  when '6'
    puts b.list_tenants

  when '7'
    people << b.create_prospect
    b.prospects[people[people.length - 1].name] = people.last
  else 
    puts "invalid menu choice. Press enter and try again."
end
gets
response = menu
end






# binding.pry