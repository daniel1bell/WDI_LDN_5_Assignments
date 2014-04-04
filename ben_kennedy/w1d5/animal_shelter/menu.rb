require 'pry'

def menu
  puts "**** Animal Shelter App****"
  puts ''
  puts "1 : list available animals in shelter"
  puts "2 : add an animal to the shelter"
  puts "3 : list clients"
  puts "q : quit the program"
  puts ""

  gets.chomp
end

