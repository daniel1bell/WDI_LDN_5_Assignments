class Stock
attr_accessor :code, :number_stocks, :name, :stock_price
attr_reader :value

  def initialize(code, number_stocks, name, stock_price)
    @code = code
    @number_stocks = number_stocks
    @name = name
    @stock_price = stock_price
    @value = (number_stocks * stock_price).to_f.round(2)
  end

  def to_s
    "#{code}:\t#{name}\t\t-> #{number_stocks} shares @ $#{stock_price} = $#{value}"
  end

end