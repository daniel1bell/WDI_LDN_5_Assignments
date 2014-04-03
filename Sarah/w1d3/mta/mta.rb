all_stops = { "n_line" => ["ts" , "34th" , "28th-n", "23rd-n","us", "8th-n"], "l_line" => ["8th-l","6th","us", "3rd","1st"], "s_line" => ["gc", "33rd", "28th-s", "23rd-s", "us", "ap"]}
lines = ['n_line', "l_line", "s_line"]

# getting on line
puts "Which line would you like to get on? n_line, l_line, s_line?"
on_user_input = gets.chomp
while lines.include?(on_user_input) == false
  puts "Please enter n_line, s_line or l_line"
  on_user_input = gets.chomp
end
on_line = all_stops[on_user_input]

# getting on stop
print "Which stop would you like to get on: "
on_line.each { |stop| print "#{stop}, " }
print "?"
puts ""
on_stop = gets.chomp
while on_line.include?(on_stop) == false
  puts "Please enter the name of the stop you want to get on from the list above"
  on_stop = gets.chomp
end

# getting off line
puts "Which line would you like to get off? n_line, l_line, s_line?"
off_user_input = gets.chomp
while lines.include?(off_user_input) == false
  puts "Please enter n_line, s_line or l_line"
  off_user_input = gets.chomp
end
off_line = all_stops[off_user_input]

# getting off stop
print "Which stop would you like to get on: "
off_line.each { |stop| print "#{stop}, " }
print "?"
puts ""
off_stop = gets.chomp
while off_line.include?(off_stop) == false
  puts "Please enter the name of the stop you want to get off from the list above"
  off_stop = gets.chomp
end

if on_user_input == off_user_input
  number_stops = (on_line.index(off_stop) - on_line.index(on_stop)).abs

else
number_stops = (off_line.index(off_stop) - off_line.index("us")).abs + (on_line.index("us") - on_line.index(on_stop)).abs
end

puts "You have #{number_stops} stops"