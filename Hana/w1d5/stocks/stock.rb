class Stock
  attr_accessor :name, :price, :quantity

  
  def initialize(name, price, quantity)
    @name = name
    @price = price
    @quantity = quantity
 
  end

def to_s
  value = (price * quantity).round(2)
  "#{name}: #{quantity} share(s) at $#{price}, Total Value = $#{value}"
end

end