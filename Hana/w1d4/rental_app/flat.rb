

class Flat
  attr_accessor :name, :price, :bedrooms, :bathrooms, :tenants

def initialize (name, price, bedrooms, bathrooms)
  @name = name
  @price = price
  @bedrooms = bedrooms
  @bathrooms = bathrooms
  @tenants = {}
end

def vacant?
  tenants.empty?
end

end