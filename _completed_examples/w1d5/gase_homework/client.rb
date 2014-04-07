class Client
  attr_accessor :name, :portfolios

  def initialize(name, deposit)
    @name = name
    @balance = deposit
    @portfolios = {}
  end

  def balance
    @balance
  end

  def deposit(funds)
    @balance += funds
  end

  def withdraw(funds)
    @balance -= funds if funds <= @balance
  end

  def can_purchase_stock?(amount)
    amount <= @balance
  end

  def create_portfolio(name)
    portfolios[name] = Portfolio.new(name) if portfolios[name].nil?
  end

  def position
    @balance + portfolio_total
  end

  def portfolio_total
    @portfolios.values.map(&:position).compact.reduce(:+) || 0
  end

  def sell_stock_in_portfolio(name, symbol, shares)
    if portfolios[name] && portfolios[name].stocks[symbol] && shares <= portfolios[name].stocks[symbol].shares
      amount = Stock.quote(symbol) * shares
      deposit(amount)
      portfolios[name].sell_stock(symbol, shares)
    end
  end

  def add_stock_to_portfolio(name, symbol, shares)
    amount = Stock.quote(symbol) * shares
    if portfolios[name] && can_purchase_stock?(amount)
      portfolios[name].buy_stock(symbol, shares)
      withdraw(amount)
    end
  end

  def to_s
    "#{@name} has #{@portfolios.count} portfolios worth $#{portfolio_total.round} and $#{@balance.round} in cash for a total of $#{position.round}"
  end
end
