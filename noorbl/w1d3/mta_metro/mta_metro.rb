
n_line = ["ts", "34th", "28th", "23rd", "us", "8th"]
l_line = ["8th", "6th", "us", "3rd", "1st"]
s_line = ["gc", "33rd", "28th_s", "23rd_s", "us", "ap"]

a_lines = {"n_line" => n_line, "l_line" => l_line, "s_line" => s_line}


puts "On which line do you get on?"
a_lines.keys.each { |line| print "#{line} "}
first_line = gets.chomp
puts first_line

  puts "At which station do you get on? "
  a_lines[first_line].each { |station| print "#{station} " } 
  print ": "
  first_station = gets.chomp
  puts first_station

puts "On which line do you get off?"
a_lines.keys.each { |line| print "#{line} "}
second_line = gets.chomp
puts second_line

  puts "At which station do you get off? "
  a_lines[second_line].each { |station| print "#{station} " }
  print ": "
  second_station = gets.chomp
  puts second_station

number_of_stations = (a_lines[second_line].index(second_station) - a_lines[first_line].index(first_station)).abs
puts "The length of your journey is: #{number_of_stations}"









