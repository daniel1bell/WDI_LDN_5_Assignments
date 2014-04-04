require 'pry'
@metro_hash = {
:n_line_sub_array => {"ts" => 4,  "34" => 3, "28" => 2, "23" => 1, "8" => 1},
:l_line_sub_array => {"8" => 2, "6" => 1, "3" => 1, "1" => 2},
:six_line_sub_array => {"gc" => 4, "33" => 3, "28" => 2, "23" => 1, "ap" => 1}
}


def menu
  # Clear the screen, and present the user with a menu
  puts `clear`
  puts "Metro Map if you would like to quit hit (q)"
  puts "Starting Point"
  puts "---------------------"
  puts "Line N, L, or 6:" 
  gets.chomp.downcase
end


def n_line_method
    puts "Station (ts) times square, (34)th, (28)th, (23)rd, (8)th:"
    start_station = gets.chomp.downcase
    @to_union_square = @metro_hash[:n_line_sub_array][start_station].to_f
    destination_station
end

def l_line_method
    puts "Station (8)th, (6)th, (3)rd, (1)st:"
    start_station = gets.chomp.downcase
    @to_union_square = @metro_hash[:l_line_sub_array][start_station].to_f
    destination_station
end
   
def six_line_method
    puts "Station (gc) grand central, (33)rd, (28)th, (23)rd, (ap) astor place:"
    start_station = gets.chomp.downcase
    @to_union_square = @metro_hash[:six_line_sub_array][start_station].to_f
    destination_station
end

def destination_station
puts "Destination"
puts "--------------------------------------------"
puts "Line N, L, or 6:"
end_line = gets.chomp.downcase
case end_line
  when "n"||"n line"||"nline"
    puts "Station (ts) times square, (34)th, (28)th, (23)rd, (8)th:"
    end_line = :n_line_sub_array
  when "l"||"l line"||"lline"
    puts "Station (8)th, (6)th, (3)rd, (1)st:"
    end_line = :l_line_sub_array
  when "6"||"six"||"six line"||"6 line"||"6line"||"sixline"
    puts "Station (gc) grand central, (33)rd, (28)th, (23)rd, (ap) astor place:"
    end_line = :six_line_sub_array
end
end_station = gets.chomp.downcase
from_union_square = @metro_hash[end_line][end_station].to_f
total = @to_union_square + from_union_square
total.to_s
puts "Your trip will take #{total} stops!"
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