class Brokerage
  attr_accessor :name, :clients

  def initialize(name)
    @name = name
    @clients = {}
  end

  def list_clients
    if clients.any?
      clients.values.join("\n")
    else
      puts "There are currently no Clients - go and do some Business Development" 
    end
  end

  def list_portfolio
    clients.each do |name, client| #puts client
      client.portfolios.each do |name, portfolio| puts portfolio.name
      end
    end
  end 



end
