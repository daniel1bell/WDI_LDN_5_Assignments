class Portfolio

attr_accessor :name, :stocks, :value

	def initialize(name)
	@name = name
	@stocks = {}
	end
end