class Stock

  def initialize(stock_symbol, units)
    @stock_symbol = stock_symbol.upcase
    @stock = YahooFinance::get_standard_quotes(stock_symbol)[stock_symbol]
    @units = units
    if stock == nil
      puts "\nYou have entered an invalid stock symbol.\n"
    else
      @stock_name = stock.name
      @start_stock_price = stock.lastTrade
      @start_investment = start_stock_price * units
      @stock_array = [@stock_symbol, @stock_name, @start_stock_price, @start_investment]
      stocks[@stock_symbol] = @stock_array
    end
  end


  end

  def buy_stock(stock_symbol, units)
    

  def check_stock
    @current_stock_price = stock.lastTrade
    @current_investment = @current_stock_price * @units
  end
































end