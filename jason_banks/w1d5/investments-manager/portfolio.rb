class Portfolio

  attr_accessor :type, :stocks

  def initialize(type)
    @type = type
    @stocks = {}
  end

  def calc_portfolio_balance
    portfolio_balance = 0
    stocks.each { |stock, values| portfolio_balance += values.get_current_investment }
    if portfolio_balance < 0
      portfolio_balance = 0
    end
    portfolio_balance
  end

  def calc_portfolio_start_balance
    portfolio_start_balance = 0
    stocks.each { |stock, values| portfolio_start_balance += values.start_investment }
    portfolio_start_balance
  end





end