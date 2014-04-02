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
  starting_station = gets.chomp
  # puts "Which station do you want to get off?"
  # end_station = gets.chomp
when "l"
  puts "Which station do you want to start?"
  starting_station = gets.chomp
  # puts "Which station do you want to get off?"
  # end_station = gets.chomp
when "s"
  puts "Which station do you want to start?"
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
  end_station = gets.chomp
when "l"
  puts "Which station do you want to get off?"
  end_station = gets.chomp
when "s"
  puts "Which station do you want to get off?"
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

# puts "us_on_the_startline #{us_on_the_startline}"
# puts "us_on_the_endline #{us_on_the_endline}"
# puts "second_line #{second_line}"
# puts "first_line #{first_line} "


# number_of_stops = second_line - first_line 
result = number_of_stops.to_i.abs

# number_of_stops = Lines[end_line].index(end_station) - Lines[starting_line].index(starting_station)


puts result
