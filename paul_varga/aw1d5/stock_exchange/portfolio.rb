class Portfolio
  attr_accessor :name
  attr_reader :stocks

  def initialize(name)
    @name = name
    @stocks = {}
  end

  def list_stocks
    stocks.each do |name, stock| 
      puts "Name: #{stock.name} Value: #{stock.price * stock.quantity}\n"
    end
  end


end