class Stock
  attr_accessor :ticker, :name, :quantity, :price
  attr_reader :value

  def initialize(ticker, name, quantity, price)
    @ticker = ticker
    @name = name   
    @quantity = quantity
    @price = price 
    @value = (quantity * price).to_f.round(2)
  end

  def to_s
    "#{ticker}: #{name} with a quantity of #{quantity} shares and a US$#{stock_price} equals a value of $#{value}"
  end

end

