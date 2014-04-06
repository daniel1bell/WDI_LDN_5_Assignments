class Stock
  attr_accessor :name, :price, :quantity

  
  def initialize(name, price, quantity)
    @name = name
    @price = price
    @quantity = quantity
 
  end

end