require 'pry'

my_array = (1..105).to_a

my_array.each do |num|
  if num % 7 == 0 && num % 5 == 00 && num % 3 == 00
    puts "Pling-Plang-Plong"
  elsif num % 7 == 0 && num % 5 == 00
    puts "Plang-Plong"
  elsif num % 5 == 0 && num % 3 == 00
    puts "Pling-Plang"
  elsif num % 7 == 0 && num % 3 == 00
    puts "Pling-Plong"
  elsif num % 7 == 0
    puts "Plong"
  elsif num % 5 == 0
    puts "Plang"
  elsif num % 3 == 0
    puts "Pling"
  else
    puts num.to_s
  end
end

# binding.pry