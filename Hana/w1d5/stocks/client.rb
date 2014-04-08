
class Client
  attr_accessor :name, :balance, :portfolio
 

  def initialize(name, balance)
    @name = name
    @balance = balance
    @portfolio = {}    
  end

def to_s
  return_value = "#{name}"
  # : Balance = #{balance}, Portfolio(s) = #{portfolio.keys.join(", ")}"
  return_value
end

def client_info
  "---------------------\n
  Balance: $#{balance} \nPortfolio(s) = #{portfolio.keys.join(", ")}"
end

def create_portfolio

end

end