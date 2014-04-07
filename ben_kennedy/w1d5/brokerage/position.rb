require 'pry'
require 'yahoofinance'
require_relative 'securities'
require_relative 'tools'
require_relative 'client'

class Position
  attr_accessor :shares, :security

  def initialize(shares, security)
    @security = security
    @shares = shares
  end

  def Position.buy_securities(security_ticker, user, brokerage)
    security = Security.create(security_ticker)
    puts "The share price is #{security.price}"
    puts "How many shares will you purchase?"
   # binding.pry
    shares = valid_number_input.to_i
    if brokerage.users[user].reduce_balance(security.price * shares) != false
      brokerage.users[user].reduce_balance(security.price * shares)
      puts "Portfolio updated"
      Position.new(shares, security)
    else
      puts "ERROR.  You do not have sufficient funds."
    end
  end

  def sell_securities

  end

end