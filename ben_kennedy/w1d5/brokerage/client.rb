require 'pry'

class Client
  attr_accessor :name, :opening_balance, :portfolios

  def initialize(name, opening_balance)
    @name = name
    @opening_balance = opening_balance
    @portfolios =  [ ]
  end

  def Client.create_user
    puts " "
    puts "What is the new client's name?"
    name = gets.chomp
    puts " "
    puts "What is #{name}'s opening balance?"
    opening_balance = valid_number_input
    return Client.new(name, opening_balance)
    puts " "
    puts "A new user has been created"
    puts " "

  end

end
