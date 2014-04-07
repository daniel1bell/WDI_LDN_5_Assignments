require 'pry-byebug'

n = ["ts", "34th", "n28th", "n23rd", "us", "8th"]
l = ["8th", "6th", "us", "3rd", "1st"]
s = ["gc", "33rd", "28th", "23rd", "us", "ap"]
quit = false

puts `clear`
puts "*** Welcome to the MTA ***"

puts "What line are you travelling on - (l)-Line, (n)-Line, (s)-Line?"
start_line_input = gets.chomp.downcase

puts "What station do you want to start your journey? "
start_station = gets.chomp

puts "What line is your destination on?"
end_line = gets.chomp.downcase

puts "What is your destination?: "
end_station = gets.chomp

all_lines = {
"n" => ["ts", "34th", "n28th", "n23rd", "us", "8th"],
"l" => ["8th", "6th", "us", "3rd", "1st"],
"s" => ["gc", "33rd", "28th", "23rd", "us", "ap"]
}

#binding.pry

start_line = all_lines[start_line_input]
end_line = all_lines[end_line]
# us_start = all_lines[start_line_input].index("us")
# us_end = all_lines[start_line_input].index("us")


if end_line == start_line
number_of_stops = end_line.index(end_station) - start_line.index(start_station)
 puts number_of_stops.abs

else

number_of_stops = (us_start - end_line).abs + (us_end - start_line).abs

end