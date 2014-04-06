class Stock

  attr_reader :stock_symbol, :units, :investment, :current_investment, :current_stock_price

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
  end
    

  def get_current_stock_price
    @current_stock_price = stock.lastTrade
  end

  def get_current_investment
    @current_investment = current_stock_price * units
  end

  def buy_more_units(additional_units)
    units += additional_units
    puts "\n#{additional_units} of #{stock_symbol} have been purchased."
  end

































end