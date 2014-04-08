class Stock

  attr_accessor :stock_symbol, :investment, :stock, :start_investment, :stock_name, :units, :stock_name_combo

  def initialize(stock_symbol, units)
    @stock_symbol = stock_symbol.upcase
    @stock = YahooFinance::get_standard_quotes(stock_symbol)[stock_symbol]
    @units = units
    @stock_name = stock.name
    @start_stock_price = stock.lastTrade
    @start_investment = @start_stock_price * units
    @stock_name_combo = "#{@stock_name} (#{@stock_symbol}, #{units} units)"
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
    additional_investment = additional_units * get_current_stock_price
    @start_investment += additional_investment
    puts "\n#{additional_units} units of #{stock_symbol} have been purchased."
  end

  def calc_stock_sale(units_to_sell)
    return_investment = units_to_sell * get_current_stock_price
    @start_investment -= return_investment
    @units -= units_to_sell
    binding.pry
    puts "\n#{units_to_sell} units of #{stock_symbol} have been sold.\n\n"
  end

  def to_s
    print stock_name_combo
  end




end