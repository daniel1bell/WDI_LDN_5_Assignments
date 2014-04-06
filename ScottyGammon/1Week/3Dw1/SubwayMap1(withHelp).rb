lines = {
  N_Line: ['TimesSquare', 'ThirtyFourth', 'TwentyEighth', 'TwentyThird', 'UnionSquare', 'Eighth'],
  L_Line: ['EighthAlt', 'Sixth', 'UnionSquare', 'Third', 'First'],
  Six_Line: ['GrandCentral', 'ThirtyThird', 'TwentyEighthAlt', 'TwentyThirdAlt', 'UnionSquare', 'AstorPlace']
}
=begin
Step 1. Ask the user what line they are getting on.
Step 2. Ask the user what station they are getting on.
Step 3. Ask user what line they plan on getting off.
Step 4. Ask user what station they are getting off.
Step 5. Compare stattions to see if they will be staying on the same line
Step 6. If there is a transfer, intersect at Union Square and transfer them, continueing to count.
Step 7. Count up the stops and continue
=end

def prompt_user(message)
  puts message
  gets.chomp
end

def how_many_stops(lines, line, station)
  start_index = lines[line].index(station)
  intersection_index_on_start_line = lines[line].index('UnionSquare')
  (start_index - intersection_index_on_start_line)
end

start_line = prompt_user("Which line are you getting on? Options are N_Line, L_Line, Six_Line").to_sym

if lines.has_key?(start_line)

	lines[:N_Line].each do |line|
		puts "The list of stations in N Line is: #{line}"
	end
end
if lines.has_key?(start_line)

	lines[:L_Line].each do |line|
		puts "The list of stations in L Line is: #{line}"
	end
end
if lines.has_key?(start_line)

	lines[:Six_Line].each do |line|
		puts "The list of stations in Six Line is: #{line}"
	end
end

start_station = prompt_user("Which station are you getting on?")
end_line = prompt_user("Which line are you getting off? Options are N_Line, L_Line, Six_Line").to_sym
end_station = prompt_user("Which station are you getting off?")

start_distance = how_many_stops(lines, start_line, start_station)
end_distance = how_many_stops(lines, end_line, end_station)

total_distance = (start_distance + end_distance).abs #Thanks to Sarah for telling me about .abs

puts "You will travel a total of #{total_distance} stops on your trip."