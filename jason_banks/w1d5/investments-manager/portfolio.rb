class Portfolio

  attr_accessor :type, :stocks
  attr_reader :balance, :stock, :stock_symbol, :start_stock_price, :stock_name, :start_investment

  def initialize(type)
    @type = type
    @stocks = {}
  end

  def add_new_stock(stock_symbol, units)
    @stock_symbol = stock_symbol
    @units = units
  end


  


  
























end