class Brokeridge
  attr_accessor :name, :address, :clients

  def initialize(name, address)
    @name = name
    @address = address
    @clients = {}
  end

  def list_clients
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
