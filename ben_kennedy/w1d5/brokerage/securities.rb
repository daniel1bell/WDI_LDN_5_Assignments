require 'pry'
require 'yahoofinance'

class Security
  attr_accessor :ticker, :name, :price

  def initialize(ticker)
    @ticker = ticker
    @price = YahooFinance::get_standard_quotes(ticker)[ticker].lastTrade
  end

  def Security.create(ticker)
    Security.new(ticker)
    #check to confirm ticker is valid
  end


end
