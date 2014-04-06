class Client
  attr_accessor :name
  attr_reader :balance, :portfolio

  def initialize(name, balance)
    @name = name
    @balance = balance
    @portfolio = {}    
  end

def to_s
  return_value = "#{name}: Balance = #{balance}, Portfolio(s) = #{portfolio.key.join(",")}"
  return_value
end


end