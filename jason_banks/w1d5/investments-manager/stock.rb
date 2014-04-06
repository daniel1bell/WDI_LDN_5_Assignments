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

  def buy_more_units
    puts "\nCurrent units: #{units}."
    puts "Current investment: #{current_investment}."
    print "Additional units to purchase: "
    response = gets.chomp
    while !is_a_number(response) || response.include?(".") || number_get_and_confirm(response) < 0
      print "\nInvalid entry. Units should be a positive whole number: "
      response = gets.chomp
    end
    units += number_get_and_confirm(response)
  end

































end