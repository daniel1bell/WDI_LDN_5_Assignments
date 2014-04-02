# Function definitions first
def menu
  # Clear the screen, and present the user with a menu
  puts `clear`
  puts "***CalcIt***"
  print "(b)asic, (a)dvanced, or (q)uit: "
  gets.chomp.downcase
end


def basic_calc
  # ask the user which operation they want to perform
  print "(a)dd, (s)ubtract, (m)ultiply, (d)ivide: "
  operation = gets.chomp.downcase
 
  #ask for the numbers
  if operation == 'a' || operation == 's' || operation == 'm'|| operation == 'd'
    puts "first number:"
    number_one = gets.chomp.to_f
    puts "second number:"
    number_two = gets.chomp.to_f
  else
  result = "Invalid"
  end

  case operation
  when 'a'
    result = number_one + number_two
  when 's'
    result = number_one - number_two
  when 'm'
    result = number_one * number_two
  when 'd'
    result = number_one / number_two    
  end
puts result.to_s
end
 
 #advanced calculation method
 def advanced_calc
  print "(p)ower, (s)quare root: "
  operation = gets.chomp.downcase

  case operation
  when 'p'
    puts "first number:"
    number_one = gets.chomp.to_f
    puts "second number:"
    number_two = gets.chomp.to_f
    result = number_one ** number_two
  when "s"
    puts "first_number"
    number_one = gets.chomp.to_f
    result = Math.sqrt(number_one)
  else
    result = "Invalid"
  end
  puts result.to_s
 end

 
# run the app...
response = menu
 
while response != 'q'
  case response
  when 'b'
    basic_calc
  when 'a'
    advanced_calc
  else
    puts "Invalid, type something else"
  end
  puts "press any key to go back to the menu"
  gets
  response = menu
end