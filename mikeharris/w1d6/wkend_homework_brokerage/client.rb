class Client
  attr_accessor :name
  attr_reader :portfolio
  attr_writer :money

  def initialize(name, money)
    @name = name
    @money = money.to_f
    @portfolio = {}
  end

  def show_money
    @money   
  end

  
  def buy_stock(stock_ticker, stock_price, nos_shares)
      @money = @money - stock_price * nos_shares 

  end

  

end
