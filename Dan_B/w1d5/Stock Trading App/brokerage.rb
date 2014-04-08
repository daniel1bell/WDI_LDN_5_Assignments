class Brokerage
attr_accessor :name, :clients

  def initialize(name)
    @name = name
    @clients = {}
    # @balance = clients.values_at(stock_value).inject{|sum,x| sum + x}
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