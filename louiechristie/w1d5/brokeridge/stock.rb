class Stock
  attr_accessor :code, :name, :quantity, :value

  def initialize(code, quantity)
    @code = code
    @name = YahooFinance::get_standard_quotes(code)[code].name
    @quantity = quantity
    @value = quantity * YahooFinance::get_standard_quotes(code)[code].lastTrade
  end

  def value
    quantity * YahooFinance::get_standard_quotes(code)[code].lastTrade
  end

  def to_s
    "Code: #{@code}, Name: #{@name}, Quantity: #{@quantity}, Value: #{value.round(2)}"
  end
end
