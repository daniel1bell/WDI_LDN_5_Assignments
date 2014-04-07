class Portfolio
  attr_accessor :name, :stocks

  def initialize(name)
    @name = name
    @stocks = {}
  end

  def buy_stock(symbol, shares)
    if @stocks[symbol].nil?
      @stocks[symbol] = Stock.new(symbol, shares)
    else
      @stocks[symbol].buy(shares)
    end
  end

  def sell_stock(symbol, shares)
    @stocks[symbol].sell(shares) if @stocks[symbol]
  end

  def position
    @stocks.values.map(&:position).reduce(:+)
  end

  def to_s
    "#{@name} has #{@stocks.count} stocks worth $#{position.round}"
  end
end
