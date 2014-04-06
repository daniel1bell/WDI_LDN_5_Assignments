require 'pry'

class Client

  def initialize(name, opening_balance)
    @name = name
    @opening_balance = opening_balance
  end

  def create
    Puts "What is the new client's name?"
    name = gets.chomp
    Puts "What is #{name}'s opening balance?"
    opening_balance = valid_number_input
    Client.new(name, opening_balance)
  end
  
end
