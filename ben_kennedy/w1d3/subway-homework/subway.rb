require 'pry'
subway = {l_line: [ "8th", "6th", "Union Square", "3rd", "1st"],
          n_line: ["Times Square", "34th", "28th", "23rd", "Union Square", "8th"]
          }

def line
  puts "(n)-line, (l)-line, or the (6)"
  gets.chomp
end

def stations(line, transport_system)
  puts transport_system[:l_line].join(", ") if line == "l"
  puts transport_system[:n_line].join(", ") if line == "n"
  gets.chomp
end

def define(var)
  var = :l_line if var == "l"
  var = :n_line if var == "n"
end


puts "On what line will your journey start?"
start_line = line
puts "Which station will you board at?"
start_station = stations(start_line, subway)
puts "On what line will your journey end?"
finish_line = line
puts "At which station will your journey end?"
finish_station = stations(finish_line, subway)
# binding.pry

start_line = define(start_line)
finish_line = define(finish_line)

if start_line == finish_line
  distance = (subway[start_line].index(start_station) - subway[finish_line].index(finish_station)).abs 
else
  binding.pry
  distance_start_line =  (subway[start_line].index(start_station) - subway[start_line].index("Union Square")).abs
  distance_finish_line = (subway[finish_line].index(finish_station) - subway[finish_line].index("Union Square")).abs
  distance = distance_start_line + distance_finish_line
end

puts "You'll travel #{distance} stops to get from #{start_station} to #{finish_station}"