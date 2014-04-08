require 'pry'
require 'tool'

def menu
  puts "**** Animal Shelter App****"
  puts ''
  puts "1 : list available animals in shelter"
  puts "2 : donate an animal to the shelter"
  puts "3 : list clients"
  puts "4 : create new animal"
  puts "5 : create new client"
  puts "6 : adopt an animal from the shelter"
  puts "q : quit the program"
  puts ""

  gets.chomp
end

def create_new_animal(shelter)
  puts "What is the animal's name?"
  name = gets.chomp
  puts "What is the anmimal's age?"
  age = gets.chomp.to_i
  puts "What is the animal's sex?"
  sex = gets.chomp
  puts "What breed is the animal?"
  breed = gets.chomp
  puts "What is the animal's favorite_toy?"
  favorite_toy = gets.chomp
  new_animal = Animal.new(name, age, sex, breed, favorite_toy) 
  puts "Who owns the animal: the (s)shelter or an (o)wner?"
  owner = valid_string_input(['s','o'])

  case owner
  when 's'
    puts 'which shelter?'
    binding.pry


  when 'o'

  binding.pry
end

