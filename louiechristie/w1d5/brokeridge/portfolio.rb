class Portfolio

  attr_reader :stocks

  def initialize ()
    @stocks = {}
  end

  def add_stock(code, quantity)
    if stocks.has_key?(code)
      stocks[code].quantity = stocks[code].quantity + quantity
    else
      stocks[code] = Stock.new(code, quantity)
    end
  end

  def total
    stocks.values.inject(0) do |sum, stock|
      sum + stock.value
    end
  end

  def to_s
    "#{@stocks.values.join("\n")} \n-----\nTotal: #{total}"
  end
end
