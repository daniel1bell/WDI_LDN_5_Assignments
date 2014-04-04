class Flat
  attr_accessor :name, :price, :bedrooms, :bathrooms
  attr_reader :tenants

  def initialize(name, price, bedrooms, bathrooms)
    @name = name
    @price = price
    @bathrooms = bathrooms
    @bedrooms = bedrooms
    @tenants = {}
  end

  def vacant?
    tenants.empty?
  end

  def list_tenants
    tenants.keys.join(", ")
  end

  def to_s
    return_value = "#{name}: a #{bedrooms} bedroom, #{bathrooms} bathroom property for £#{price}"
    return_value << ". Currently let to: #{list_tenants}" if tenants.any?
    return_value
  end

end