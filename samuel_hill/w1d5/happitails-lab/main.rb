require 'pry'

require_relative 'menu'
require_relative 'shelter'
require_relative 'animal'
require_relative 'person'

s = Shelter.new('Happitails')

p1 = Person.new('Dave',456197)
p2 = Person.new('Maria',283763)
p3 = Person.new('Harry',978340)
p4 = Person.new('Donny',871213)

a1 = Animal.new('Cosmo','Pitbull', 2, "male", "squeeker")
a2 = Animal.new('Simba','African Lion', 15, "female", "humans")
a3 = Animal.new('Timon','Meerkat', 6, "male", "pumba")
a4 = Animal.new('Pumba','Warthog', 10, "male", "timon")
a5 = Animal.new('Bertie','Pug',1, "male", "ball")

available_pets = [a1, a2, a3, a4, a5]
available_pets.each {|pet| s.animals[pet.name] = pet }

s_prospects = [p1, p2, p3, p4]
s_prospects.each {|client| s.clients[client.name] = client }



response = menu
while response != "q"

  case response
  when "1"
    puts s.list_available_pets
  when "2"
    # puts s.list_clients
  when "3"
    puts s.list_prospects
  when "4"
    s.add_prospect
  when "5"
    s.add_pet
  when "6"
    # abandon_pet
  when "7"
    puts adopt_animal
  else
    print "Invalid menu choice. Please try again."
  end
puts "\nPress enter to continue."
gets
  response=menu
end

binding.pry