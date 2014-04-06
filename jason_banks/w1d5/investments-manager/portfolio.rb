class Portfolio

  attr_accessor :type, :stocks
  attr_reader :portfolio_balance

  def initialize(type)
    @type = type
    @stocks = {}
  end

  def calc_portfolio_balance
    @portfolio_balance = stocks.each.current_investment.reduce { |sum, n| sum + n }
  end





  


  
























end