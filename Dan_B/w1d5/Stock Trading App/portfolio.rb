class Portfolio
attr_accessor :name, :stocks

  def initialize(name)
    @name = name
    @stocks = {}
    @value = stocks.values_at(value).inject{|sum,x| sum + x}
  end




end