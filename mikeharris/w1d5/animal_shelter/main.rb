#animal shelter
#jsgklsh

require 'pry'
#load files
require_relative 'shelter.rb'
require_relative 'person.rb'
require_relative 'animal.rb'
require_relative 'menu.rb'

s1 = Shelter.new("Shelter1")

p1 = Person.new("Paul", 26, "male", 0)
p2 = Person.new("Mike", 33, "male", 0)
p3 = Person.new("Michael", 42, "male", 1)

a1 = Animal.new("flopsy", "rabbit", 3, "female", "helicopter")
a2 = Animal.new("rover", "dag", 5, "male", "bone")
a3 = Animal.new("nemo", "fish", 33, "female", "treasure chest")

p1.pets[a1.name] = a1
p2.pets[a2.name] = a2


s1.clients[p1.name] = p1
s1.clients[p2.name] = p2
s1.clients[p3.name] = p3
s1.animals[a3.name] = a3


#run command line interaction
response = menu.downcase

while response != "q"
  case response 
  when "1" 
    puts s1.list_animals  
  when "2" 
    puts s1.list_clients #add list animals
  when "3"
    abandon_animal(s1) #TODO
  when "4"
    adopt_animal(s1)
  else 
    puts "Invlalid entry try again - hit enter to continue"
    
  end 
  print "\nHit Enter to continue"
  gets  

  response = menu
end


binding.pry



