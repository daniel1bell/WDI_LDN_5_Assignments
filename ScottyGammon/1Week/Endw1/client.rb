class Client
  attr_accessor :name, :money
  attr_reader :portfolios, :stocks

  def initialize(name, money)
    @name = name
    @money = money
    @portfolios = {}
    @stocks= {}
  end

  def empty?
    portfolios.empty?
  end

  def list_tenants
    portfolios.keys.join(", ")
  end

  def to_s
    return_value = "#{name}: with £#{money} available liquidity."
    return_value << "Owns #{list_portfolios}" if portfolios.any?
    return_value
  end
end