require 'pry'
require 'yahoofinance'
require_relative 'securities'

class Position
  attr_accessor :shares, :security

  def initialize(shares, security)
    @security = security
    @shares = shares
  end

end