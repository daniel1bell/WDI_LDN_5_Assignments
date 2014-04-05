require "pry"

require_relative "menu"
require_relative "client"
require_relative "portfolio"








response = menu

while response != "q"
  case response
  when "1"
    puts
  when "2"
    puts
  when "3"
    puts
  when "4"
    puts
  when "5"
    puts
  else
    puts "Invalid choice."
  end
  puts "\nPress enter to continue."
  gets

  response = menu
end

Puts "\nGood job, Broseph.\n\n"














