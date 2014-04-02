all_stops = { "ts" => "n_line", "34th" => "n_line", "28th-n" => "n_line", "23rd-n" => "n_line","us-n"=> "n_line","8th-n" => "n_line", "8th-l" => "l_line","6th"=> "l_line","us-l"=> "l_line", "3rd"=> "l_line","1st"=> "l_line"}
n_line = [ "ts", "34th", "28th", "23rd-n","us","8th" ]
l_line = ["8th","6th","us", "3rd","1st"]

# getting on line
puts "Which line would you like to get on? n_line, l_line?"
on_user_input = gets.chomp
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

# getting off line
puts "Which line would you like to get off? n_line, l_line?"
off_user_input = gets.chomp
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

if on_user_input == off_user_input
  number_stops = (on_line.index(off_stop) - on_line.index(on_stop)).abs

else
#union square station of on_line
on_line.collect! { |stop|
  (stop.match("us")) ? "on_union_square" : stop
}

 #union square station of on_line
off_line.collect! { |stop|
  (stop.match("us")) ? "off_union_square" : stop
}

#intersecting the lines
total_journey_line = on_line | off_line
number_stops = (total_journey_line.index(off_stop) - total_journey_line.index("off_union_square")).abs + (total_journey_line.index("on_union_square") - total_journey_line.index(on_stop)).abs
end

puts "You have #{number_stops} stops"