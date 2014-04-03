# Define data 
Lines = {"n" => 
          ["ts", "34th", "28th", "n23rd", "us", "8th"],
        "l" =>
          ["8th", "6th", "us", "3rd", "1st"],
        "s" =>
          ["gc", "33rd", "28th", "s23rd", "us", "ap"] 
          }

# n = ["ts", "34th", "n28th", "n23rd", "us", "8th"]
# l = ["8th", "6th", "us", "3rd", "1st"]
# s = ["gc", "33rd", "28th", "s23rd", "us", "ap"]

starting_line = 0
end_line = 0

#Ask for starting line:
puts "Which line do you take?"
print "(n) line , (l) line , (s) line , "
until starting_line == "n" || starting_line == "l" || starting_line == "s" 
  starting_line = gets.chomp
end

case starting_line
when "n"
  puts "Which station do you want to start?"
  puts "ts, 34th, 28th, n23rd, us, 8th"
  starting_station = gets.chomp
  # puts "Which station do you want to get off?"
  # end_station = gets.chomp
when "l"
  puts "Which station do you want to start?"
  puts "8th, 6th, us, 3rd, 1st"
  starting_station = gets.chomp
  # puts "Which station do you want to get off?"
  # end_station = gets.chomp
when "s"
  puts "Which station do you want to start?"
  puts "gc, 33rd, 28th, s23rd, us, ap"
  starting_station = gets.chomp
  # puts "Which station do you want to get off?"
  # end_station = gets.chomp
end

#Ask for end line:
puts "Which line do you want to end?"
print "(n) line , (l) line , (s) line , "
until end_line == "n" || end_line == "l" || end_line == "s" 
  end_line = gets.chomp
end

case end_line
when "n"
  puts "Which station do you want to get off?"
  "ts, 34th, 28th, n23rd, us, 8th"
  end_station = gets.chomp
when "l"
  puts "Which station do you want to get off?"
  puts "8th, 6th, us, 3rd, 1st"
  end_station = gets.chomp
when "s"
  puts "Which station do you want to get off?"
  puts "gc, 33rd, 28th, s23rd, us, ap"
  end_station = gets.chomp
end

first_line = Lines[starting_line].index(starting_station)
second_line = Lines[end_line].index(end_station)
us_on_the_startline = Lines[starting_line].index("us")
us_on_the_endline = Lines[end_line].index("us")


if starting_line == end_line
  number_of_stops = second_line - first_line
else
  number_of_stops = (us_on_the_endline - second_line) + (us_on_the_startline - first_line)
end

puts "us_on_the_startline #{us_on_the_startline}"
puts "us_on_the_endline #{us_on_the_endline}"
puts "second_line #{second_line}"
puts "first_line #{first_line} "


number_of_stops = second_line - first_line 
result = number_of_stops.to_i.abs

number_of_stops = Lines[end_line].index(end_station) - Lines[starting_line].index(starting_station)







# n = ["ts", "34th", "28th", "23rd", "us", "8th"]
# l = ["8th", "6th", "us", "3rd", "1st"]
# s = ["gc", "33rd", "28th", "23rd", "us", "ap"]
# quit = false

# puts `clear`
# puts "*** Welcome to the station stop calculator ***"

# puts "What line are you travelling on (n)-Line, (l)-Line, (s)-Line?"
# start_line = gets.chomp.downcase

# puts "What station do you want to start your journey?:"
# start_station = gets.chomp

# puts "What line is your destination on?"
# end_line = gets.chomp.downcase

# puts "What is your destination?: "
# end_station = gets.chomp

# all_lines = {
# "n" => ["ts", "34th", "28th", "23rd", "us", "8th"],
# "l" => ["8th", "6th", "us", "3rd", "1st"],
# "s" => ["gc", "33rd", "28th", "23rd", "us", "ap"]
# }

# start_line = all_lines[start_line]
# end_line = all_lines[end_line]
# us_start = all_lines[start_line].index("us")

# if end_line == start_line
# number_of_stops = end_line.index(end_station) - start_line.index(start_station)
#  puts number_of_stops.abs

# elsif 

#   number_of_stops = intersecting_staion["us"] end_line.index(end_station) + start_line.index(start_station)

# # number_of_stops = (us_start - end_line) + (us_start - start_line)

# end
