class Shelter

  attr_accessor :name, :animals, :clients

  def initialize(name)
    @name = name
    @animals = {}
    @clients = {}

  end

  def list_available_pets
    animals.keys.join(', ')
  end

  def list_prospects
    clients.keys.join(', ')
  end

  def add_prospect
    print "What is the prospect name? "
    prospect_name = gets.chomp.capitalize
    print "What is the prospect's phone number? "
    prospect_phone = gets.chomp

    clients[prospect_name] = Person.new(prospect_name, prospect_phone)
    puts "Thanks for adding #{prospect_name} as a new prospect."
  end

  def add_pet
    print "What is the pet's name? "
    pet_name = gets.chomp.capitalize
    print "What is the pet's breed? "
    pet_breed = gets.chomp.capitalize
    print "What is the pet's age? "
    pet_age = gets.chomp
    print "What is the pet's gender? "
    pet_gender = gets.chomp.capitalize
    print "What is #{pet_name}'s favourite toy? "
    pet_toy = gets.chomp
    animals[pet_name] = Animal.new(pet_name, pet_breed, pet_age, pet_gender, pet_toy)
    puts "Thanks for adding #{pet_name} as a new pet. We sure will look after them."
  end

  # def list_clients

  # end

end