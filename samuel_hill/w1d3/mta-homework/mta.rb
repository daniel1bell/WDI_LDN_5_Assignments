n_line = ["ts","34th","28th","23rd","us","8th"]
t_line = ["8th","6th","us","3rd","1st"]
s_line = ["gc","33rd","28th","23rd","us","ap"]

puts `clear`
puts "*** Welcome to the MTA Transport App ***"

puts "What station do you want to start your journey from?: "
start_station = gets.chomp
puts "What is your destination station?: "
end_station = gets.chomp

if n_line.include?(start_station && end_station) 
	number_of_stops = (n_line.index(end_station) - n_line.index(start_station)).abs
elsif t_line.include?(start_station && end_station)
	number_of_stops = (t_line.index(end_station) - t_line.index(start_station)).abs
elsif s_line.include?(start_station && end_station)
	number_of_stops = (s_line.index(end_station) - s_line.index(start_station)).abs
end

puts "Your journey is only #{number_of_stops} stop(s)! Enjoy your ride!"
puts "Press Enter to continue."
gets

# part_one = (n_line.index("us") - n_line.index(start_station)).abs
# part_two = (t_line.index("us") - t_line.index(end_station)).abs

# journey_interchange = part_one + part_two

# puts "Your journey is only #{journey_interchange} stop(s)! Please remember to change at Union Square! Enjoy your ride!"
# puts "Press Enter to continue."
# gets