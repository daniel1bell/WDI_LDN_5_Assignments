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
	
puts "Which line are you getting on? Options are N_Line, L_Line, Six_Line"
In_Line = gets.chomp

puts "Which station are you getting on?"
In_Station = gets.chomp

puts "Which line are you getting off? Options are N_Line, L_Line, Six_Line"
Out_Line = gets.chomp

puts "Which station are you getting off?"
Out_Station = gets.chomp

def prompt_user(message)
  puts message
  gets.chomp
end

def distance_to_intersection(lines, line, station)
  start_index = lines[line].index(station)
  intersection_index_on_start_line = lines[line].index('UnionSquare')
  (start_index - intersection_index_on_start_line)
end

In_Line.to_sym
In_Station.to_sym
Out_Line.to_sym
Out_Station.to_sym

start_distance = distance_to_intersection(lines, In_Line, In_Station)
end_distance = distance_to_intersection(lines, Out_Line, Out_Station)

total_distance = start_distance + end_distance

puts "The distance is: #{total_distance}"

