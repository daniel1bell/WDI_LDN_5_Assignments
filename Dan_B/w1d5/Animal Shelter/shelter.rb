class Shelter
  attr_accessor :name, :animals, :clients

  def initialize(name)
    @name = name
    @animals = {}
    @clients = {}
  end

  def list_available_pets
    if !animals.empty?
       print animals.values.join("\n")
    else
      "You have no animals in the shelter."
    end
  end

  def list_prospects
    if clients.each do |name, values|
      if values.pets.empty?
        print values
      end
    end
    else
      puts "I'm sorry, there are no prospects at the moment. Return to the menu and choose option 4 to add a prospect."
    end
  end

  def list_clients
    if clients.each do |name, values|
      if !values.pets.empty?
        print values
      end
    end
    else
      puts "I'm sorry, there are no clients at the moment. Return to the menu and choose option 7 to ReHome a Pet, which will create a client."
    end
  end

  def list_clients_prospects
    if !clients.empty?
      list_prospects
      list_clients
      puts
    else
      puts "Sorry! There are neither clients nor prospects at the moment. Please find and add more prospects to continue."
    end
  end

end