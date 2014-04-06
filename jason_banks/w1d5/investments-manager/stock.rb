class Stock

  attr_reader :stock_symbol, :investment, :stock, :start_investment, :stock_name, :units

  def initialize(stock_symbol, units)
    @stock_symbol = stock_symbol.upcase
    @stock = YahooFinance::get_standard_quotes(stock_symbol)[stock_symbol]
    @units = units
    @stock_name = stock.name
    @start_stock_price = stock.lastTrade
    @start_investment = @start_stock_price * units
  end

  def get_current_stock_price
    stock.lastTrade
  end

  def get_current_investment
    current_investment = get_current_stock_price * units
    if current_investment < 0
      current_investment = 0
    end
    current_investment
  end

  def buy_more_units(additional_units)
    @units += additional_units
    @start_investment += (additional_units * get_current_stock_price)
    puts "\n#{additional_units} of #{stock_symbol} have been purchased."
  end




end