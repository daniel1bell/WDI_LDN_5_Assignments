class Portfolio
  attr_accessor :name, :date, :client

  def initialize(name, date, client)
    @name = name
    @date = date
    @client = client
    @stocks = {}
  end

  def display_clients
    @clients.values.join("\n")
  end

  def display_stocks
    @stocks.values.join("\n")
  end