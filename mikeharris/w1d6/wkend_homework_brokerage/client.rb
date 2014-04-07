class Client
  attr_accessor :name
  attr_reader :portfolio
  attr_reader :money

  def initialize(name, money)
    @name = name
    @money = money.to_f
    @portfolio = {}
  end

  #can add in verification details when asking for moeny and  portfoliio
  def show_money
    @money   
  end

  def list_portfolio
    @portfolio
  end

  def buy_stock(stock_ticker, stock_price, nos_shares)
    if portfolio[stock_ticker]        
        portfolio[stock_ticker].buy_more_shares(stock_price, nos_shares)       
    else
        t = Trade.new(stock_ticker, stock_price, nos_shares)
        portfolio[stock_ticker] = t
    end
    @money = @money - stock_price * nos_shares
  end

  def sell_stock(stock_ticker, stock_price, nos_shares)
    portfolio[stock_ticker].sell_shares(nos_shares)
    @money = @money + stock_price * nos_shares
  end


end
