require "pry"

require_relative "shelter"
require_relative "person"
require_relative "animal"
require_relative "menu"

s = Shelter.new



p1 = Person.new("Jason", 444)
p2 = Person.new("Scotty", 555)

a1 = Animal.new("Rox", :dog, 3, :male)
a2 = Animal.new("Tiramisu", :cat, 1, :female)
a3 = Animal.new("Noisy", :bird, 7, :male)
a4 = Animal.new("Hudson", :dog, 4, :male)
a5 = Animal.new("Jungle", :chameleon, 13, :female)
a6 = Animal.new("Hula", :bird, 5, :male)

[a1, a2, a3, a4, a5, a6].each do |animal|
  s.animals[animal.name] = animal
end


p2.pets[a5.name] = a5
p2.pets[a6.name] = a6

response = menu.downcase

while response != "q"
  case response
  when "1"
    puts s.list_animals
  when "2"
    puts s.list_clients
  when "3"
    puts s.add_client
  when "4"
    puts s.adopt_animal
  when "5"
    puts s.assign_animal
  else
    puts "Invalid menu choice."
  end
  puts "Press enter to return to menu."
  gets

  response = menu

end





