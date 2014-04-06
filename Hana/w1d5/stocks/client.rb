class Client
  attr_accessor :name
  attr_reader :balance, :portfolio

  def initialize(name, balance)
    @name = name
    @balance = balance
    @portfolio = {}    
  end