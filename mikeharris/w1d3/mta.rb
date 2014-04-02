lines = { "n" => %w(ts 34th 28th-n 23rd-n US 8th-n),
          "l" =>  %w(8th-l 6th US 3rd 1st),
          "s" => %w(GC 33rd 28th-s 23rd-s US AP)}


def print_lines (availiable_lines)
  availiable_lines.each {|line| print "(" , line , ") "}
    puts "."
end

def print_stops (lines , line)
  lines[line].each_index do |i|
     print "(" , i + 1 , ")" , lines[line][i] , "\n"     
   end
end

def get_line (message, availiable_lines)
    print "Which line would you like to get #{message}:  "
    print_lines(availiable_lines)

    user_line_input = gets.chomp;
    
    if !availiable_lines.include?(user_line_input) 
      puts ("Not a valid line - please try again.")
      user_line_input =  get_line(message, availiable_lines)
    end 

    user_line_input
end

def get_stop (message, lines, line)
    puts "Which station would you like to get #{message} "
    print_stops(lines, line)

    user_input_stop = gets.chomp.to_i
    
    if !user_input_stop.between?(1, lines[line].size)  
      puts "Not a valid stop - please try again."
      user_input_stop = get_stop(message, lines, line)
    end
  
    user_input_stop
end

def mta (lines)
  puts `clear`

  availiable_lines = lines.keys   

  get_on_line = get_line("on" , availiable_lines)

  get_on_stop = get_stop("on", lines, get_on_line)

  get_off_line = get_line("off", availiable_lines)

  get_off_stop = get_stop("off", lines, get_off_line)
   
  if get_on_line == get_off_line 
    distance_travelled = (get_on_stop - get_off_stop).abs
  else 
    #asssuming only one intersecting staion
    intersect_station = (lines[get_on_line] & lines[get_off_line])[0]
    distance_travelled_first_line = (lines[get_on_line].index(intersect_station) + 1 - get_on_stop).abs 
    distance_travelled_second_line = (lines[get_off_line].index(intersect_station) + 1 - get_off_stop).abs 
    distance_travelled = distance_travelled_first_line + distance_travelled_second_line
  end

  puts "Number of stops travelled #{distance_travelled}"
  
  puts "Hit q to exit - otherwise enter to plan another journey"
  continue = gets.chomp

  unless continue == "q"
    mta (lines)
  end

end 

mta(lines)





