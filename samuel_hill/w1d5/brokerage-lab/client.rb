class Client

	attr_accessor :name, :portfolios, :balance

	def initialize(name,balance)
		
		@name = name
		@balance = balance
		@portfolios = {}

	end




end