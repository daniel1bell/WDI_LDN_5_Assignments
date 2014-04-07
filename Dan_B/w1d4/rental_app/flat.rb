class Flat
  attr_accessor :name, :bedrooms, :bathrooms, :price
  attr_reader :tenants

  def initialize(name, price, bedrooms, bathrooms)
    @name = name
    @price = price
    @bedrooms = bedrooms
    @bathrooms = bathrooms
    @tenants = {}
  end

  def vacant?
    tenants.empty?
  end

  def occupied?
    !tenants.empty?
  end

end