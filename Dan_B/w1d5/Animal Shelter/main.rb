require 'pry'

require_relative 'menu'
require_relative 'shelter'
require_relative 'animal'
require_relative 'person'

s = Shelter.new('Happitails')

a1 = Animal.new('Cosmo','Pitbull', 2, "Male", "Squeeker")
a2 = Animal.new('Simba','African Lion', 15, "Female", "Human\ Bone")
a3 = Animal.new('Timon','Meerkat', 6, "Male", "Pumba")
a4 = Animal.new('Pumba','Warthog', 10, "Male", "Timon")
a5 = Animal.new('Bertie','Pug',1, "Male", "Ball")

p1 = Person.new('Dave',456197)
  p1.pets[a1.name] = a1
p2 = Person.new('Maria',283763)
  p2.pets[a2.name] = a2
  p2.pets[a3.name] = a3
p3 = Person.new('Harry',978340)
p4 = Person.new('Donny',871213)


available_pets = [a4, a5]
available_pets.each {|pet| s.animals[pet.name] = pet }

s_prospects = [p1, p2, p3, p4]
s_prospects.each {|client| s.clients[client.name] = client }

response = menu
while response != "q"

  case response
  when "1"
    s.list_available_pets
  when "2"
    s.list_clients
  when "3"
    s.list_prospects
  when "4"
    add_prospect(s)
  when "5"
    add_pet(s)
  when "6"
    abandon_pet(s)
  when "7"
    rehome_pet(s)
  else
    print "Invalid menu choice. Please try again."
  end
puts "\nPress enter to continue."
gets
  response=menu
end

binding.pry