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
    "Sorry no animals in shelter"
  end
end

def list_clients
  if clients.any?
    clients.values.join("\n")
  else
    'No CLients'
  end

end


end
