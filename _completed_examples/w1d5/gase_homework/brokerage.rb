class Brokerage
  attr_accessor :name, :clients

  def initialize(name)
    @name = name
    @clients = {}
  end

  def add_client(name, deposit)
    @clients[name] = Client.new(name, deposit) unless @clients[name]
  end

  def client(name)
    @clients[name]
  end
end
