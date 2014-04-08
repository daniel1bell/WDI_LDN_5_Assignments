class Client
  attr_accessor :name, :cash, :portfolios

  def initialize(name, cash)
    @name = name
    @cash = cash
    @portfolios = {}
  end

  def to_s
    return_value = "#{name}, a client, with GBP #{cash} in the account.\n"
    if portfolios.any? 
     return_value << "#{name} owns the following portfolios:\n#{owned_portfolios}\n"
    else 
    return_value << "#{name} currently owns no portfolio.\n"
    end
  end

  def owned_portfolios
    portfolios.keys.join("\n")
  end

  def list_stocks
    portfolios.each do |name, portfolio| 
      puts name
      portfolio.list_stocks
    end 
  end

end