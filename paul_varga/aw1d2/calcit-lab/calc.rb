# Function definitions first
def menu
  # Clear the screen, and present the user with a menu
  puts `clear`
  puts "***CalcIt - Noor, Mike and Paul´s completely awesome calculator***"
  print "(b)asic, (a)dvanced, or (q)uit: "
  gets.chomp.downcase
end


def basic_calc
  # ask the user which operation they want to perform
  print "(a)dd, (s)ubtract, (m)ultiply, (d)ivide: "
  operation = gets.chomp.downcase

  if operation == "a" || operation == "s" || operation == "m" || operation == "d"
    print "Enter first number: "
    first_number = input_number
    print "Enter second number: "
    second_number = input_number
    puts "The answer is "
  end

  
    case operation
    when 'a'  
      puts first_number + second_number
    when 's'  
      puts first_number - second_number
    when 'm'  
      puts first_number * second_number
    when 'd'  
      puts first_number / second_number
    else 
      puts "You are an idiot - try again" 
  end

puts "Hit enter to continue"
gets

end


def advanced_calc
  # ask the user which operation they want to perform
  print "(p)ower, (m)modulus, (s)quare root: "
  operation = gets.chomp.downcase

if operation == "p" || operation == "m" || operation == "s"
  print "Enter first number: "
  first_number = input_number

  if operation != "s"
    print "Enter second number: "
    second_number = input_number
  end
  
  puts "The answer is "
end

  case operation
    when 'p' 
      puts first_number**second_number
    when 'm' 
      puts first_number % second_number
    when 's' 
      puts Math.sqrt(first_number) 
    else 
      puts "You are an idiot - try again"
  end

  puts "Hit enter to continue"
  gets

end


def input_number
  gets.chomp.to_f
end


# run the app...

response = menu

while response != 'q'
  case response
  when 'b'
    basic_calc
  when 'a'
    advanced_calc
  end

  response = menu
end