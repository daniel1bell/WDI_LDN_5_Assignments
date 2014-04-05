require "pry"
require "yahoofinance"

require_relative "menu"
require_relative "client"
require_relative "portfolio"
require_relative "management"


def valediction

  a = "\nWell done, Broseph.\n\n"
  b = "\nFour score and seven years of awesomeness, Abroham Lincoln.\n\n"
  c = "\nRambro, you are crushing it.\n\n"
  d = "\nEpic client management, Brodysseus.\n\n"

  valedictions = [a, b, c, d]
  puts valedictions.sample
end

m = Management.new

c1 = Client.new("Miranda", 1111, 20_000)
c2 = Client.new("Chandler", 2222, 36_000)
c3 = Client.new("Jack", 3333, 8_500)
c4 = Client.new("Leslie", 4444, 19_858)



[c1, c2, c3, c4].each { |client| m.clients[client.name] = client }





response = menu

while response != "q"
  case response
  when "1"
    m.list_clients
  when "2"
    m.add_client
  when "3"
    puts
  when "4"
    puts
  when "5"
    puts
  when "6"
    puts
  when "7"
    puts
  else
    puts "Invalid choice."
  end
  puts "\nPress enter to continue."
  gets

  response = menu
end

if m.clients.empty?
  exit
else
  valediction
end














