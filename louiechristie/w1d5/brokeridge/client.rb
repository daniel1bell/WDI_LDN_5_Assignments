class Client
  attr_accessor :name, :balance, :portfolios

  def initialize(name, balance)
    @name = name
    @balance = balance
    @portfolios = {}
  end

  def display_portfolios
    "Portfolios: #{@portfolios.keys.join(', ')}"
  end

  def add_portfolio(portfolio_name)
    portfolio = Portfolio.new()
    portfolios[portfolio_name] = portfolio
  end

  def to_s
    "#{@name} has balance #{@balance}"
  end
end
