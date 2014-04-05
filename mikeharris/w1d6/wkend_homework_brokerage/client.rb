class Client
  attr_accessor :name, :phone
  attr_reader :portfolio

  def initialize(name, money)
    @name = name
    @money = money.to_f
    @portfolio = {}
  end

  def buy_stock(stock_name, stock_price, nos_shares)
  #todo     

     money = money - stock_price * nos_shares 

  end



end
