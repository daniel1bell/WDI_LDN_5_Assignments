require 'pry'
require 'yahoofinance'

class Security
  attr_accessor :ticker, :name, :price

  def initialize(ticker)
    @ticker = ticker
    @price = YahooFinance::get_standard_quotes(ticker)[ticker].lastTrade
  end




end
