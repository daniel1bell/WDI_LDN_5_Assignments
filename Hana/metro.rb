require 'pry'
n_line = {"ts" => 4, "34" => 3, "28" => 2, "23" => 1, "8" => 1}
l_line = {"8" => 2, "6" => 1, "3" => 1, "1" => 2}
six_line = {"gc" => 4, "33" => 3, "28" => 2, "23" => 1, "ap" => 1}

def menu
  # Clear the screen, and present the user with a menu
  puts `clear`
  puts "Metro Map if you would like to quit hit (q)"
  puts "Beginning point - Line:"
  gets.chomp.downcase
end


def n_line_method

end

def l_line_method

end

def six_line_method

end


case start_line
  when "n"||"n line"||"nline"
    puts "Station (ts) times square, (34)th, (28)th, (23)rd, (8)th:"
    start_staion = gets.chomp.downcase
    start_line = n_line
binding.pry
  when "l"||"l line"||"lline"
    puts "Station (8)th, (6)th, (3)rd, (1)st:"
    start_staion = gets.chomp.downcase
    start_line = l_line
  when "6"||"six"||"six line"||"6 line"||"6line"||"sixline"
    puts "Station (gc) grand central, (33)rd, (28)th, (23)rd, (ap) astor place:"
    start_staion = gets.chomp.downcase
    start_line = six_line
end

puts "Destination:"
puts "Line:"
end_line = gets.chomp.downcase
puts "Station:"
end_station = gets.chomp.downcase

total = startline[start_station]




end

response = menu
while response != 'q'
  case response
  when "n"||"n line"||"nline"
    n_line_method
  when "l"||"l line"||"lline"
    l_line_method
  when "6"||"six"||"six line"||"6 line"||"6line"||"sixline"
    six_line_method
  end
  puts "Press any key to return to the menu."
  gets
  response = menu
end