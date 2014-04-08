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
    print "What is the prospect's phone number"
    prospect_phone = gets.chomp

    clients[prospect_name] = Person.new(prospect_name, prospect_phone)
    puts "Thanks for adding #{prospect_name} as a new prospect."
  end

  def add_pet
    print "What is the animals name?"
    animal_name = gets.chomp.capitalize
    print "What is the animals breed?"
    animal_breed = gets.chomp
    print "What is the animals age?"
    animal_age = gets.chomp
    print "What is the animals gender?"
    animal_gender = gets.chomp
    print "What is the animals favorite toy?"
    animal_toy = gets.chomp

    animals[animal_name] = Animal.new(animal_name, animal_breed, animal_age, animal_gender, animal_toy)
    puts "Thanks for adding #{animal_name} the #{animal_breed} as a new animal."
  end

  def adopt_animal
  print "Which Animal?: #{list_available_pets}"
  animal_name = gets.chomp
  puts "Which prospect?: #{list_prospects}"
  new_owner = gets.chomp

  

  end 


  # def list_clients
  # clients[pets].any?
  # end

end