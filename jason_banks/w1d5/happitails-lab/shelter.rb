class Shelter

  attr_accessor :animals, :clients

  def initialize
    @animals = {}
    @clients = {}
  end

  def list_animals
    puts "1. List Animals to Adopt"
    puts "2. List Animals Adopted"
    print "----> "

    choice = gets.chomp

    if choice == "1"
      list_of_animals = animals.select { |animal, values| values.client.empty?}
      list_of_animals.values.join("\n\n")
    elsif choice == "2"
      list_of_animals = animals.reject { |animal, values| values.client.empty?}
      binding.pry
      if list_of_animals.any?
        list_of_animals.join("\n")
      else
        puts "There are no adopted animals."
      end
    else
      puts "Invalid choice."
    end
  end

  def list_clients
    puts 
  end




























end