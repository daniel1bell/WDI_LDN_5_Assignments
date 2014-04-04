class Shelter
  attr_accessor :name
  attr_reader :animals, :clients

  def initialize(name)
    @name = name
    @animals = {}
    @clients = {}
  end 

  def list_animals
    if animals.any?
      animals.values.join("\n")
    else
      "There are currently no animals available"
    end
  end

  def list_clients
    if clients.any?
      clients.values.join("\n")
    else
      "We have no clients at the moment, go out and get some."
    end
  end

  

end