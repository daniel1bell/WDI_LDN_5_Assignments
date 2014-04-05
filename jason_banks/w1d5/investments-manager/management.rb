class Management

  attr_accessor :clients

  def initialize
    @clients = {}
  end

  def list_clients
    if clients.any?
      puts "\nWe have #{clients.length} clients.\n\n"
      clients.values.join("\n")
      puts "\n\n"
    else
      puts "\nWe have no clients.\nQuel bromaggedon!"
    end
  end
















end