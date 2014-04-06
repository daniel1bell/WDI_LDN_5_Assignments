class Stock
attr_accessor :code, :number_stocks
attr_reader :name, :stock_price, :value

  def initialize(code, number_stocks, name, stock_price)
    @code = code
    @number_stocks = number_stocks
    @name = name
    @stock_price = stock_price
    @value = (number_stocks * stock_price).to_f.round(2)
  end




end