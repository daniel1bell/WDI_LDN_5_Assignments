class Stock
  attr_accessor :code, :name, :quantity

  def initialize(code, name, quantity)
    @code = code
    @name = name
    @quantity = quantity
  end

  def to_s
    "Stock #{@code}, #{@name}, quanity #{@quantity}"
  end
end
