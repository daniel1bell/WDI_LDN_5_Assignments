class Person < Stock
  attr_accessor :age, :num_portfolios

  def initialize(name, age, num_portfolios)
    super(name, age)
    @num_portfolios = num_portfolios
    @portfolios = {}
  end

  def display_porfolios
    portfolios.values.join("\n")
  end

  def to_s
    "#{@name} is a #{age} year old client who has the following number of #{portfolios}"
  end
end