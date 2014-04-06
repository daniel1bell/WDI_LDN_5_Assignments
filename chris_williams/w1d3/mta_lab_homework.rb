require 'pry'

def menu
  puts `clear`
  puts "subway mapper"
  print "press 's' key to start or 'q' to quit: "
  gets.chomp.downcase
end

def mapper
  n = [:'42-st', :'34-st', :'28-st-bwy', :'23-st-bwy', :'14-st', :'8-st']
  l = [:'8-ave', :'6-ave', :'14-st', :'3-ave', :'1-ave']
  six = [:'42-st-park', :'33-st', :'28-st-park', :'23-st-park', :'14-st', :'astor-pl']
  train = { n: n, l: l, six: six}
  puts "what train are you taking? "
  train.each_key {|train| puts "(#{train}) " }
  starting_train = gets.chomp.to_sym
  puts "what station are you getting on at? "
  train[starting_train].each {|station| puts "(#{station}) " }
  starting_station = gets.chomp.to_sym
  puts "what train are you getting off of? "; 
  train.each_key {|train| puts "(#{train}) " }
  ending_train = gets.chomp.to_sym
  puts "what station are you getting off at? "
  train[ending_train].each {|station| puts "(#{station}) " }
  ending_station = gets.chomp.to_sym
    if starting_train == ending_train
      stops = (train[starting_train].index(starting_station) - train[starting_train].index(ending_station)).abs
    else
      intersection = (train[starting_train] & train[ending_train])[0]
      starting_train_distance = (train[starting_train].index(starting_station) - train[starting_train].index(intersection)).abs
      ending_train_distance = (train[ending_train].index(ending_station) - train[ending_train].index(intersection)).abs
      stops = starting_train_distance + ending_train_distance
    end
  puts "it will take you #{stops} stop(s)."
  print "press any key to continue: "
  gets
end

response = menu

while response != 'q'
  case response
  when 's'
    mapper 
  end
  response = menu
end