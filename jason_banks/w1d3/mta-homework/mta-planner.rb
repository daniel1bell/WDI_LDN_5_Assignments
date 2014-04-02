require "pry"
require "pry-byebug"

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


n_line = [:"Times Square", :"N: 34th", :"N: 28th", :"N: 23rd", :"Union Square", :"N: 8th"]
l_line = [:"L: 8th", :"L: 6th", :"Union Square", :"L: 3rd", :"L: 1st"]
six_line = [:"Grand Central", :"6: 33rd", :"6: 28th",
  :"6: 23rd", :"Union Square", :"Astor Place"]

mta_lines = {:"N line" => n_line, :"L line" => l_line, :"6 line" => six_line}



puts `clear`
puts "*** MTA Journey Planner ***\n\nPlease enter choice as provided.\n\n"

puts "On which line will your journey BEGIN:"
print_options(mta_lines.keys)
beginning_line = confirm_choice(mta_lines.keys, gets.chomp.to_sym)
beginning_line_array = mta_lines[beginning_line]

puts "\nAnd which stop on the #{beginning_line}:"
print_options(beginning_line_array)
beginning_stop = confirm_choice(beginning_line_array, gets.chomp)
beginning_stop_index = beginning_line_array.index(beginning_stop)

puts "\nOn which line will your journey END:"
print_options(mta_lines.keys)
ending_line = confirm_choice(mta_lines.keys, gets.chomp.to_sym)
ending_line_array = mta_lines[ending_line]

puts "\nAnd which stop on the #{ending_line}:"
print_options(ending_line_array)
ending_stop = confirm_choice(ending_line_array, gets.chomp)
ending_stop_index = ending_line_array.index(ending_stop)

total_stops = ending_stop_index - beginning_stop_index
if total_stops < 0
  total_stops = total_stops * -1
end

if total_stops > 0
  puts "\nYour journey from #{beginning_stop} to #{ending_stop} consists of #{total_stops} stop(s)."
  puts "Godspeed, you world-weary traveler, you.\n\n"
else
  puts "\nYour journey starts and ends in the same location."
  puts "Are you a tourist?\n\n"
end






