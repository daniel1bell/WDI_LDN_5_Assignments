require 'pry'

class Portfolio
  attr_accessor :id, :positions

  def initialize(id)
    @id = id
    @positions = { }
  end

  def Portfolio.create_portfolio(id)    
    puts " "
    puts "A new portfolio has been created"
    puts " "
    Portfolio.new(id)
  end

  def buy_securities

  end

  def sell_securities

  end

  def list_portfolios

  end

  def list_positions(user, portfolio)
    puts "#{user}: #{portfolio}"
    binding.pry
    users[user].portfolios[portfolio].each { 
     |key, values| }
  end


end
