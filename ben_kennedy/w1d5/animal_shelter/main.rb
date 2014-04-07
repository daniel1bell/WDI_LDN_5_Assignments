# # Overview
# ==========
# You are the manager at HappiTails animal shelter. You want an app to manage your clients, and the animals.

# ## Tasks
# ========

# * Manage the clients coming into the shelter. Track their names, ages, gender, kids and the number of pets they have.
# * Manage the animals. Track their names, breed, age, gender and their favorite toys.
# * A client will want to come and see the list of available animals to adopt
# * A client will want to come in and give up their animal for adoption
# * A manager will want to list the animals in the shelter
# * A manager will want to list the clients

require 'pry'
require_relative 'animal'
require_relative 'person'
require_relative 'shelter'
require_relative 'menu'

#set up data

s = Shelter.new("Farringdon Animal Shelter")
a1 = Animal.new("Banjo", 4, nil, "Terrier", "ball")
a2 = Animal.new("Spot", 1, nil, "Pit Bull", "bone")
a3 = Animal.new("Spike", 8, nil,  "Jack Russell", "squeeky toy")

[a1, a2].each { |animal| s.animals[animal.name] = animal }

p1 = Person.new("Chris", 26, "male")
clients_table = [p1]
p1.pets[a3.name] = a3
s.clients[p1.name] = p1



# binding.pry
# run program

response = menu.downcase

while response != 'q'

  case response
    when "1"
      puts s.list_animals

    when "2"
      puts s.give_up_animal 

    when "3"
      puts s.list_clients

    when '4'
      create_new_animal #todo

    when '5'
      create_new client # todo

    when '6'
      adopt_animal # to do

    else
      puts "invalid menue choice"

  end
  puts "\n press enter to continue"
  gets

  response = menu

end

