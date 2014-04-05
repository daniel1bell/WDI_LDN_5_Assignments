class Portfolio

  attr_accessor :client_name, :type, :stocks
  attr_reader :balance, :stock_symbol, :stock_price, :stock_name, :investment, :stock_time

  def initialize(client_name, type)
    @client_name = client_name
    @type = type
    @stocks = {}
  end

  def buy_stock(stock_symbol, units)
    stock = YahooFinance::get_standard_quotes(stock_symbol)[stock_symbol]
    @stock_symbol = stock_symbol
    if @stock == nil
      puts "\nYou have entered an invalid stock symbol.\n"
    else
      @stock_name = stock.name
      @stock_price = stock.lastTrade
      @investment = @stock_price * units
      stock_array = [@stock_symbol, @stock_name, @stock_price, @investment]
      stocks[stock_symbol] = stock_array
      @stock_time = stock.time
    end
  end


























end