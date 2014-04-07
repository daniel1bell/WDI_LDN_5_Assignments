require 'pry'

# load files
require_relative 'shelter'
require_relative 'menu'
require_relative 'animal'
require_relative 'person'



s1 = Shelter.new('Shelter 1')

p1 = Person.new('Paul', 26, 'male', 0)
p2 = Person.new('Mike', 33, 'male', 0)
p3 = Person.new('Michael', 42, 'male', 1)

a1 = Animal.new('Flopsi', 'Rabbit', 3, 'female', 'helicopter')
a2 = Animal.new('Rover', 'Dog', 5, 'male', 'bone')
a3 = Animal.new('Nemo', 'Fish', 33, 'female', 'treasure chest')

p1.pets[a1.name] = a1
p2.pets[a2.name] = a2

s1.clients[p1.name] = p1
s1.clients[p2.name] = p2
s1.clients[p3.name] = p3
s1.animals[a3.name] = a3


response = menu.downcase
while response != 'q'
  case response
  when '1'
    puts s1.list_animals 
  when '2'
    puts s1.list_clients
  when '3'
    abandon_animal(s1) #TD
  when '4'
    adopt_animal(s1)
    puts s1.list_clients
  else
    puts "invalid menu choice" 
  end
  puts "\npress enter to continue."
  gets

  response = menu

end


binding.pry