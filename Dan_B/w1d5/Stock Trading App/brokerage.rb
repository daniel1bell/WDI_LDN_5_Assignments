class Brokerage
attr_accessor :name, :clients

  def initialize(name)
    @name = name
    @clients = {}
  end

  def broker_balance
    balance_array = clients.map {|code, info| info.balance}
    balance_array.compact!
    unless balance_array.empty?
      balance_array.reduce(:+)
    end
  end

  def list_clients
    unless clients.empty?
      clients.each do |keys, values|
        print values
      end
    end
  end

  def list_client(name)
    puts
    puts clients.fetch(name).portfolios.values.join("\n")
  end

end