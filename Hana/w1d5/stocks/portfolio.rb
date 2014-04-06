class Portfolio
  attr_accessor :name
  attr_reader :stocks

  def initialize(name)
   @name = name
   @stocks = {}  
  end
end