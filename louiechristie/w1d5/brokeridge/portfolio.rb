class Portfolio
  attr_reader :stocks

  def initialize ()
    @stocks = []
  end

def  buy_stock(code, quantity)
  stocks << Stock.new(code, quantity)
end

def sell_stock(code)
  stocks[].delete(code)
end

  def to_s
    "#{@stocks.join('/n')}"
  end
end
