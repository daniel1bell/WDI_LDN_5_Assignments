class Stock
  attr_accessor :symbol, :shares

  def self.get_standard_quotes(symbol)
    YahooFinance::get_standard_quotes(symbol)[symbol] rescue nil
  end

  def self.quote(symbol)
    get_standard_quotes(symbol).lastTrade rescue 0
  end

  def name
    @name ||= (Stock.get_standard_quotes(symbol).name rescue symbol)
  end

  def initialize(symbol, shares)
    @symbol = symbol
    @shares = shares
  end

  def buy(shares)
    @shares += shares
  end

  def sell(shares)
    @shares -= shares if shares <= @shares
  end

  def position
     Stock.quote(@symbol) * @shares
  end

  def to_s
    "Purchased #{@shares} shares of #{name} (#{@symbol}) worth $#{position.round}"
  end

end
