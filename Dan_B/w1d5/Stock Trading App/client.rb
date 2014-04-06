class Client
attr_accessor :name, :cash, :portfolios, :password

  def initialize(name, cash)
    @name = name
    @cash = cash
    @portfolios = {}
    @stock_value = portfolios.values_at(value).inject{|sum,x| sum + x}
    @balance = stock_value+cash
    @password = password
  end




end