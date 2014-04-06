class Portfolio
  attr_reader :stocks

  def initialize ()
    @stocks = []
  end

  def to_s
    "Stocks: #{@stocks.join(', ')}"
  end
end
