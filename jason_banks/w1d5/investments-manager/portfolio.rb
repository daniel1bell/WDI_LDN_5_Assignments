class Portfolio

  attr_accessor :client_name, :type, :stocks
  attr_reader :balance

  def initialize (client_name, type, balance=0)
    @client_name = client_name
    @type = type
    @stocks = {}
  end

























end