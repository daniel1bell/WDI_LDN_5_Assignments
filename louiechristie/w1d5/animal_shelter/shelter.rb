class Shelter
  attr_accessor :name
  attr_reader :animals, :clients

def initialize(name)
    @name = name
    @animals = {}
    @clients = {}
  end

def add_a_client(name, age, gender)
  client = Person.new(name, age, gender)
  clients[name] = client
end



end