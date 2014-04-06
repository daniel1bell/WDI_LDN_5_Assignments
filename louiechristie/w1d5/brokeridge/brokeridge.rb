class Brokeridge
  attr_accessor :name, :address, :animals, :clients

  def initialize(name, address)
    @name = name
    @address = address
    @animals = {}
    @clients = {}
  end

  def display_clients
   #@clients.select {|key, value| "#{key} #{value}"}
   #keys.join("\n")
   @clients.values.join("\n")
  end

  def to_s
    "#{@name} brokeridge at #{@address} has #{@clients.count} clients"
  end

  def add_client(client_key)
    @clients[client_key] = Clients.new(client_key)
  end

  def remove_client(client_key)
    clients.delete(client_key)
  end

  

end
