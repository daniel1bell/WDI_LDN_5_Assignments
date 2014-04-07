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

  def list_portfolios

  end

  # def to_s
  #     puts "Position Overview"
  #     puts " "
  #     brokerage.users[user].portfolios[portfolio].positions.each { |ticker, details |
  #       puts "#{ticker}:  price: $#{self[ticker].price}, shares: #{self[ticker].shares}, Position Value: $#{self[ticker].shares * self[ticker].price}"
  #   }
  # end

end

def list_positions(brokerage, user, portfolio)
  puts "#{user}: #{portfolio}"
  binding.pry
  brokerage.users[user].portfolios[portfolio].positions.each { |ticker, details |
        puts "#{ticker}:  price: $#{brokerage.users[user].portfolios[portfolio].positions[ticker].security.price}, shares: #{brokerage.users[user].portfolios[portfolio].positions[ticker].shares}, Position Value: $#{ (brokerage.users[user].portfolios[portfolio].positions[ticker].security.price * brokerage.users[user].portfolios[portfolio].positions[ticker].shares).round(2)}"
    }
    puts "Your cash balance is $#{brokerage.users[user].balance}."
    puts " "
end
