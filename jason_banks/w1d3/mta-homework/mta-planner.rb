n_line = ["N: 34th", "N: 28th", "N: 23rd", "Union Square", "N: 8th"]
l_line = ["L: 8th", "L: 6th", "Union Square", "L: 3rd", "L: 1st"]
six_line = ["Grand Central", "6: 33rd", "6: 28th",
  "6: 23rd", "Union Square", "Astor Place"]

mta_lines = {:"N line" => n_line, :"L line" => l_line, :"6 line" => six_line}

def print_options(x)
  x.each { |i| print i, "   "}
  puts "?"
end



puts "*** MTA Journey Planner ***"
puts


puts "On which line will your journey BEGIN:"
print_options(mta_lines.keys)
beginning_line = gets.chomp.to_sym
puts "\nAnd which stop on the #{beginning_line}:"
print_options(mta_lines[beginning_line])
beginning_stop = gets.chomp

puts "\nOn which line will your journey END:"
print_options(mta_lines.keys)
ending_line = gets.chomp.to_sym
puts "\nAnd which stop on the #{ending_line}:"
print_options(mta_lines[ending_line])
ending_stop = gets.chomp







