require 'pry'

class Shelter
  attr_accessor :animals, :clients
  attr_reader :name

def initialize(name)
  @name = name
  @animals = { }
  @clients = { }
end

def list_animals
  # binding.pry
  if animals.any?
    animals.keys.join("\n")
  else 
    "You have no animals!"
  end
end

def list_clients
  if clients.any?
    clients.keys.join("\n")
  else
  "You have no clients!"
  end
end

def give_up_animal
  puts "Who is the client?"
  client = gets.chomp
  puts "What pet are they giving us?"
  pet = gets.chomp
  animals[pet] = clients[client].pets[pet]
  binding.pry
end


end