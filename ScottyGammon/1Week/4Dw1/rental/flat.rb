class Flat
	attr_accessor :name, :price, :bedrooms, :bathrooms
	attr_reader :tenants

def initialize(name, price, bedrooms, bathrooms)
		@name = name
		@price = price
		@bedrooms = bedrooms
		@bathrooms = bathrooms
		@tenants = {}
	end

	def vacant?
		self.tenants.empty?
	end
end