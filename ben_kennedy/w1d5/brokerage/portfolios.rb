require 'pry'

class Portfolio
  attr_accessor :id, :positions

  def initialize(id)
    @id = id
    positions = { }
  end

  def Portfolio.create_portfolio
    puts " "
    return Portfolio.new(id)
    puts " "
    puts "A new portfolio has been created"
    puts " "
  end

  def buy_securities

  end

  def sell_securities

  end

  def list_portfolios

  end

  def list_positions

  end


end
