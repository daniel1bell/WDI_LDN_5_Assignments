require 'pry'
subway = {l_line: [ "8th", "6th", "Union Square", "3rd", "1st"],
          n_line: ["Times Square", "34th", "28th", "23rd", "Union Square", "8th"],
          :"6" => ["Grand Central", "33rd", "28th", "23rd", "Union Square", "Astor Place"]
          }

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
  puts "(n)-line, (l)-line, or the (6)"
  valid_string_input(["n", "l", "6"])
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
  else
    puts "No Good!"
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




if start_line == finish_line
  distance = (subway[start_line].index(start_station) - subway[finish_line].index(finish_station)).abs 
  # binding.pry
else
  # binding.pry
  distance_start_line =  (subway[start_line].index(start_station) - subway[start_line].index("Union Square")).abs
  distance_finish_line = (subway[finish_line].index(finish_station) - subway[finish_line].index("Union Square")).abs
  distance = distance_start_line + distance_finish_line
end

puts "You'll travel #{distance} stops to get from #{start_station} to #{finish_station}"