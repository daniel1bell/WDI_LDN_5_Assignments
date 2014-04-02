def print_options(x)
  x.each { |i| print i, "   "}
  puts "?\n\n"
end

def confirm_choice(x, y)
  while x.include?(y) == false
    puts "Invalid. Please enter a choice as provided:\n"
    y = gets.chomp.to_sym
  end
  y
end

n_line = [:"Times Square", :"34th", :"28th", :"23rd", :"Union Square", :"8th"]
l_line = [:"8th", :"6th", :"Union Square", :"3rd", :"1st"]
six_line = [:"Grand Central", :"33rd", :"28th",:"23rd", :"Union Square", :"Astor Place"]

mta_lines = {:"N line" => n_line, :"L line" => l_line, :"6 line" => six_line}



puts `clear`
puts "*** MTA Journey Planner ***\n\nPlease enter choice as provided.\n\n"

puts "On which line will your journey BEGIN:"
print_options(mta_lines.keys)
beginning_line = confirm_choice(mta_lines.keys, gets.chomp.to_sym)
beginning_line_array = mta_lines[beginning_line]

puts "\nAnd which stop on the #{beginning_line}:"
print_options(beginning_line_array)
beginning_stop = confirm_choice(beginning_line_array, gets.chomp.to_sym)
beginning_stop_index = beginning_line_array.index(beginning_stop)

puts "\nOn which line will your journey END:"
print_options(mta_lines.keys)
ending_line = confirm_choice(mta_lines.keys, gets.chomp.to_sym)
ending_line_array = mta_lines[ending_line]

puts "\nAnd which stop on the #{ending_line}:"
print_options(ending_line_array)
ending_stop = confirm_choice(ending_line_array, gets.chomp.to_sym)
ending_stop_index = ending_line_array.index(ending_stop)


if beginning_line.to_s == ending_line.to_s
  total_stops = ending_stop_index - beginning_stop_index
  if total_stops < 0
    total_stops *= -1
  end
elsif beginning_stop_index == ending_stop_index
  total_stops = 0
else 
  first_leg = beginning_line_array.index(:"Union Square") - beginning_stop_index
    if first_leg < 0
      first_leg *= -1
    end
  second_leg = ending_line_array.index(:"Union Square") - ending_stop_index
    if second_leg < 0
      second_leg *= -1
    end
  total_stops = first_leg + second_leg
end

if total_stops > 0
  puts "\nYour journey from #{beginning_stop} to #{ending_stop} consists of #{total_stops} stop(s)."
  puts "Godspeed, you world-weary traveler, you.\n\n"
else
  puts "\nYour journey starts and ends in the same location."
  puts "I bet you are a tourist.  Please visit the MTA website at http://new.mta.info for further assistance.\n\n"
end






