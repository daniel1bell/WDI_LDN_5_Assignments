main.rb

require 'pry'

require_relative 'portfolio'
require_relative 'person'
require_relative 'stock'
require_relative 'menu'

brokerage = Brokerage.new('Finance Plus', 'Wallstreet')

brokerage.clients['Laura'] = Person.new('Laura, 35)
brokerage.clients['Riccardo'] = Person.new('Riccardo', 38)
brokerage.clients['Christian'] = Person.new('Christian', 34)

brokerage.portfolios['2010A'] = Portfolio.new('2010A', 4)
brokerage.portfolios['2010B'] = Porfolio.new('2010B', 4)
brokerage.portfolios['2011A'] = Porfolio.new('2011', 3)
brokerage.portfolios['2012A'] = Porfolio.new('2011' 3)

response = menu
while response.upcase != 'Q'
  case response
    when '1'
      puts brokerage.display_clients
      gets
    when '2'
      puts brokerage.display_portfolios
      gets
    when '3'
      puts brokerage.display_stocks
      gets
    when '4'
      puts create_client brokerage
    when '5'
      puts create_portfolio brokerage
    when '6'
      puts assign_stock brokerage
    when '7'
      puts dismiss_stock brokerage
    end

  response = menu
end


