require 'pry'
subway = {l_line: [ "8th", "6th", "Union Square", "3rd", "1st"],
          n_line: ["Times Square", "34th", "28th", "23rd", "Union Square", "8th"],
          :"6" => ["Grand Central", "33rd", "28th", "23rd", "Union Square", "Astor Place"],
          b_line: ["Rockefeller Center", "42nd", "34th", "23rd", "6th", "Washington Square"],
          :"Union Square" => [:l_line, :n_line, :"6"],
          :"6th" => [:l_line, :b_line],
          :"34th" => [:b_line, :n_line]
        }
# note: 6th interchange for l and b; union square for l, n and 6; 34th for the b and the n; 

def valid_string_input(array)
  input = gets.chomp
  unless array.index(input)
    puts "Not a valid entry."
    puts "Please enter one of: '#{array.join("', '")}'"
    input = gets.chomp
  end
  input
end

def line
  puts "(n)-line, (l)-line, (b)-line or the (6)"
  valid_string_input(["n", "l", "6", "b"])
end

def stations(line, transport_system)
  # puts transport_system[:l_line].join(", ") if line == "l"
  # puts transport_system[:n_line].join(", ") if line == "n"
  # puts transport_system[:"6"].join(", ") if line == "6"
  array = transport_system[line] 
  puts array.join(", ")
  valid_string_input(array)
end

def define(var)
  if var == "l"
    var = :l_line 
  elsif var =="n"
    var = :n_line 
  elsif var == "6"
    var = :"6"
  elsif var == "b"
    var = :b_line
  else
    puts "No Good!"
  end
end

def intersect(start_line, start_station, finish_line, finish_station, intersection, transport_system)
  # binding.pry
  if transport_system[intersection].include?(start_line) && transport_system[intersection].include?(finish_line) 
    distance_start_line = (transport_system[start_line].index(start_station) - transport_system[start_line].index(intersection.to_s)).abs
    distance_finish_line = (transport_system[finish_line].index(finish_station) - transport_system[finish_line].index(intersection.to_s)).abs
    distance = distance_start_line + distance_finish_line
    # binding.pry
  end
end

puts "On what line will your journey start?"
start_line = line
start_line = define(start_line)
puts "Which station will you board at?"
start_station = stations(start_line, subway)
puts "On what line will your journey end?"
finish_line = line
finish_line = define(finish_line)
puts "At which station will your journey end?"
finish_station = stations(finish_line, subway)

intersection = false

if start_line == finish_line
  distance = (subway[start_line].index(start_station) - subway[finish_line].index(finish_station)).abs 
else 
  routes = { }
  routes[:"Union Square"] = intersect(start_line, start_station, finish_line, finish_station, :"Union Square", subway) 
  routes[:"6th"] = intersect(start_line, start_station, finish_line, finish_station, :"6th", subway) 
  routes[:"34th"] = intersect(start_line, start_station, finish_line, finish_station, :"34th", subway) 
  routes.delete_if { |intersection, distance| distance == nil }.min
  intersection = routes.keys.to_s
  distance = routes.values.to_s
  # binding.pry
end


if distance == "[]"
  puts "Sorry.  I haven't figured out routes via 2 changes. So you are SOL if you want to go between the b and 6 lines."
else
puts "You'll travel #{distance} stops to get from #{start_station} on the #{start_line} to #{finish_station} on the #{finish_line}.".delete '[]_:"'
puts  "You'll need to make a change at #{intersection}.".delete '[]_:"' if intersection 
end



