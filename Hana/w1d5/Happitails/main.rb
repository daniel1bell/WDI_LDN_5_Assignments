require 'pry'

require_relative 'shelter'
require_relative 'person'
require_relative 'animal'
require_relative 'menu'

#Start up data
h = Shelter.new("Happitails")

p1 = Person.new("Bob", 15, "male")
p2 = Person.new("Shirley", 65, "female")
p3 = Person.new("Myrtle", 37, "female")

a1 = Animal.new("Rex", "Jack Russell", "male", 7)
a2 = Animal.new("Fifi", "Poodle", "female", 4)
a3 = Animal.new("Toto", "Yorkie", "female", 5)
a4 = Animal.new("Pooh", "Lab", "male", 8)
a5 = Animal.new("Zoomer", "Lab", "male", 9)
a6 = Animal.new("Buffy", "Norfolk", "female", 2)
a7 = Animal.new("Zeus", "Pitbull", "male", 5)

[a1,a2,a3,a4].each do |animal| h.animals[animal] = animal
end

response = menu.downcase
while response != "q"

  case response
    when '1'
      puts b.list_flats 

    when '2'
      puts b.list_prospects

    when '3'
      let_flat(b)

    when '4'    
      evict_tenant(b)

    when '5'    
      puts b.list_vacant_flats

    when '6'    
      puts b.list_tenants

    when '7'    
      create_prospect(b)

    when '8'
      create_flat(b)

    else
      puts "invalid menu choice."
  end
  puts "\npress enter to continue."
  gets

  response = menu

end

