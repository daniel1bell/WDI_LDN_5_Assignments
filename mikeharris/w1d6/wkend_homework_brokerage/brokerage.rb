class Brokerage
  attr_accessor :name, :stocks
  attr_reader  :clients

  def initialize (name)
    @name = name
    @stocks = {}
    @clients = {}

  end

  def update_availiable_stocks(stock_tickers)
    stock_tickers.each do |ticker|
      stocks[ticker] = {}
    end
  end


  def update_stock_data
    stocks.each do |ticker , value|
      #stocks[ticker] = YahooFinance::get_standard_quotes("#{ticker}")["#{ticker}"]
      if $saved_stock["#{ticker}"]
        stocks[ticker] = $saved_stock["#{ticker}"]
      else
        stocks.delete(ticker)
      end
    end
  end


 def list_stock_prices
      puts "Ticker  Price"
    stocks.each do |ticker, stock|
      #print ticker , ": ", stock.lastTrade, "   "
      print ticker, ":  ", stock[:lastTrade], "\n"
    end
  end


end
