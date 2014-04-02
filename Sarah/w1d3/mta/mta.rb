all_stops = { "ts" => "n_line", "34th" => "n_line", "28th-n" => "n_line", "23rd-n" => "n_line","us-n"=> "n_line","8th-n" => "n_line", "8th-l" => "l_line","6th"=> "l_line","us-l"=> "l_line", "3rd"=> "l_line","1st"=> "l_line","gc" => "s_line", "33rd" => "s_line", "28th-s" => "s_line", "23rd-s"=> "s_line", "us-s"=> "s_line", "ap" => "s_line"}
lines = ['n_line', "l_line", "s_line"]

# getting on line
puts "Which line would you like to get on? n_line, l_line, s_line?"
on_user_input = gets.chomp
while lines.include?(on_user_input) == false
  puts "Please enter n_line, s_line or l_line"
  on_user_input = gets.chomp
end
on_line = []
all_stops.each do |stop,line|
  if line == on_user_input
    on_line.push(stop)
  end
end

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
off_line = []
all_stops.each do |stop,line|
  if line == off_user_input
    off_line.push(stop)
  end
end

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
#union square station of on_line
on_line.collect! { |stop|
  (stop.match("us")) ? "on_union_square" : stop
}

 #union square station of off_line
off_line.collect! { |stop|
  (stop.match("us")) ? "off_union_square" : stop
}

#intersecting the lines
total_journey_line = on_line | off_line
number_stops = (total_journey_line.index(off_stop) - total_journey_line.index("off_union_square")).abs + (total_journey_line.index("on_union_square") - total_journey_line.index(on_stop)).abs
end

puts "You have #{number_stops} stops"