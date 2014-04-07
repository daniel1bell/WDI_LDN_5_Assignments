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

  def Position.update_position(brokerage, portfolio, user, security)
    security = Security.create(security)
    puts "The share price is #{security.price}"
    binding.pry
    old_share_count = brokerage.users[user].portfolios[portfolio].positions[security].shares
    puts "How many shares will you purchase?"
   # binding.pry
    add_shares_count = valid_number_input.to_i 
    new_share_count = add_shares_count + old_share_count
        if brokerage.users[user].reduce_balance(security.price * add_shares_count) != false
      brokerage.users[user].reduce_balance(security.price * add_shares_count)
      puts "Portfolio updated"
      Position.new(new_share_count, security)
    else
      puts "ERROR.  You do not have sufficient funds."
    end
  end

  def sell_securities

  end

end