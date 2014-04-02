require "pry"
require "pry-byebug"

n_line = ["Times Square", "N: 34th", "N: 28th", "N: 23rd", "Union Square", "N: 8th"]
l_line = ["L: 8th", "L: 6th", "Union Square", "L: 3rd", "L: 1st"]
six_line = ["Grand Central", "6: 33rd", "6: 28th",
  "6: 23rd", "Union Square", "Astor Place"]

mta_lines = {:"N line" => n_line, :"L line" => l_line, :"6 line" => six_line}

def print_options(x)
  x.each { |i| print i, "   "}
  puts "?\n\n"
end

puts `clear`
puts "*** MTA Journey Planner ***\n\nPlease enter choice as provided.\n\n"

puts "On which line will your journey BEGIN:"
print_options(mta_lines.keys)
beginning_line = gets.chomp.to_sym

puts "\nAnd which stop on the #{beginning_line}:"
print_options(mta_lines[beginning_line])
beginning_stop = gets.chomp
beginning_stop_index = mta_lines[beginning_line].index(beginning_stop)

puts "\nOn which line will your journey END:"
print_options(mta_lines.keys)
ending_line = gets.chomp.to_sym

puts "\nAnd which stop on the #{ending_line}:"
print_options(mta_lines[ending_line])
ending_stop = gets.chomp
ending_stop_index = mta_lines[ending_line].index(ending_stop)

total_stops = ending_stop_index - beginning_stop_index
if total_stops < 0
  total_stops = total_stops * -1
end

if total_stops > 0
  puts "\nYour journey from #{beginning_stop} to #{ending_stop} consists of #{total_stops} stops."
  puts "Godspeed, you world-weary traveler, you.\n\n"
else
  puts "\nYour journey starts and ends in the same location."
  puts "Are you a tourist?\n\n"
end






