

puts "Welcome to the train stop calculator. What line would you like to begin your journey on?"
puts "n, l, s"
line = gets.chomp



#if line == "n" || line == "l" || line == "s"
n = ["ts", "34th", "n28th", "n23rd", "us", "8th"]


  #if 'n' == 
  if n
    puts "Which station will you begin your journey on?"
    puts "ts" "34th" "28th" "23rd" "us" "8th"

    n_line_start = gets.chomp

    puts "Which station will you end your journey on?"
    puts "ts" "34th" "28th" "23rd" "us" "8th"

    n_line_end = gets.chomp

    number_of_stops = n.index(n_line_end) - n.index(n_line_start)
    puts number_of_stops







  elsif 'l' == line
    puts "8th, 6th, us, 3rd, 1st"
    l_line = gets.chomp
  
  elsif 's' == line
    puts "gc, 33rd, 28th, 23rd, us, ap"
    sixth_line = gets.chomp

  end
end




#n_line = [34th, 28th, 23rd, us, 8th]
#l_line = [8th, 6th, us, 3rd, 1st]
#sixth_line = [gc, 33rd, 28th, 23rd, us, ap]