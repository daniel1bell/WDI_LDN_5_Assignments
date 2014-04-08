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

a1 = Animal.new("Rex", "Dog", "male", 7)
a2 = Animal.new("Fifi", "Dog", "female", 4)
a3 = Animal.new("Toto", "Cat", "female", 5)
a4 = Animal.new("Pooh", "Cat", "male", 8)
a5 = Animal.new("Zoomer", "Dog", "male", 9)
a6 = Animal.new("Buffy", "Dog", "female", 2)
a7 = Animal.new("Zeus", "Cat", "male", 5)

[p1,p2,p3].each do |client| h.clients[client] = client
end

p1.pets[a5.name] = a5

[a6,a7].each do |pet| p2.pets[pet.name] = pet
end

# Putting animals in shelter
[a1,a2,a3,a4].each do |animal| h.animals[animal.name] = animal
end


response = menu.downcase
while response != "q"

  case response
    when '1' 
      puts "What is client name?"
      name = gets.chomp
      puts "What is client age?"
      age = gets.chomp
      puts "What is the client's gender?"
      gender = gets.chomp
      h.add_a_client(name, age, gender)

    when '2'
    #  remove a client
      puts "What is client name?"
      name = gets.chomp
      lfjsd if h.clients.include?(name)

    when '3'
     # list flats
      puts h.clients.values.join("\n")

    #when '4'    
      #evict_tenant(b)

    when '5'    
     # List all animals
     puts h.animals.values.join("\n")

    #when '6'    
      #puts b.list_tenants

    #when '7'    
     # create_prospect(b)

    #when '8'
      #create_flat(b)

    else
      puts "invalid menu choice."
  end
  puts "\npress enter to continue."
  gets

  response = menu

end

