class Management

  attr_accessor :clients

  def initialize
    @clients = {}
  end

  def list_clients
    if clients.any?
      clients.each_with_index.join()
    else
      puts "\nWe have no clients.\nQuel bromaggedon!"

  end
















end