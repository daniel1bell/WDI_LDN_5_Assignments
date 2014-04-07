class Shelter
  attr_accessor :name
  attr_reader :animals, :clients

def initialize(name)
    @name = name
    @animals = {}
    @clients = {}
  end

end