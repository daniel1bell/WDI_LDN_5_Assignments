class Brokerage
attr_accessor :name, :clients

  def initialize(name)
    @name = name
    @clients = {}
    @balance = clients.values_at(stock_value).inject{|sum,x| sum + x}
  end




end