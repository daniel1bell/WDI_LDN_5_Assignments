require 'pry'

class Portfolio
  attr_accessor :name, :stocks
  attr_reader 

  def initialize(name)
   @name = name
   @stocks = {}  
  end

  def to_s
    if stocks.empty?
      "#{name} contains no stocks."
    else
      "-------------------------\n
    
      Your stocks in #{name} Portfolio: \n#{stocks.values.join("\n")}"


   
    end

  end
end