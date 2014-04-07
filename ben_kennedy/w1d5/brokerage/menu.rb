require 'pry'
require_relative 'tools'

class Menu
 attr_accessor :name, :menu_items

  def initialize(name, options = { })
    @name = name
    @menu_items = options
  end

  def display
    puts @name
    puts " "
    @menu_items.each { |menu_key, menu_text|
      puts "'#{menu_key.to_s}' : #{menu_text}"
    }

    valid_string_input(@menu_items.keys)
  end

end

# def create_new_animal(shelter)
#   puts "What is the animal's name?"
#   name = gets.chomp
#   puts "What is the anmimal's age?"
#   age = gets.chomp.to_i
#   puts "What is the animal's sex?"
#   sex = gets.chomp
#   puts "What breed is the animal?"
#   breed = gets.chomp
#   puts "What is the animal's favorite_toy?"
#   favorite_toy = gets.chomp
#   new_animal = Animal.new(name, age, sex, breed, favorite_toy) 
#   puts "Who owns the animal: the (s)shelter or an (o)wner?"
#   owner = valid_string_input(['s','o'])

#   case owner
#   when 's'
#     puts 'which shelter?'
#     binding.pry



