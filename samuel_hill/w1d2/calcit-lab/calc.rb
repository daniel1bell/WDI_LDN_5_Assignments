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

  def add
  puts "Please type first number: "
  first_number = gets.chomp.to_i

  puts "Please type second number"
  second_number = gets.chomp.to_i

  answer = first_number + second_number

  puts "The answer is #{answer}!"

  puts "Press Enter to continue."
  gets
  end

  def subtract
  puts "Please type first number: "
  first_number = gets.chomp.to_i

  puts "Please type second number"
  second_number = gets.chomp.to_i

  answer = first_number - second_number

  puts answer

  puts "The answer is #{answer}!"
  gets
  end

  def multiply
  puts "Please type first number: "
  first_number = gets.chomp.to_i

  puts "Please type second number"
  second_number = gets.chomp.to_i

  answer = first_number * second_number

  puts "The answer is #{answer}!"

  puts "Press Enter to continue."
  gets
  end

  def divide
  puts "Please type first number: "
  first_number = gets.chomp.to_i

  puts "Please type second number"
  second_number = gets.chomp.to_i

  answer = first_number / second_number

  puts "The answer is #{answer}!"

  puts "Press Enter to continue."
  gets
  end

case operation
when "a"
  add
when "s"
  subtract
when "m"
  multiply
when "d"
  divide
else
  menu
end
end

 
def advanced_calc
  # ask the user which operation they want to perform
  print "(p)ower, (s)quare root: "
  operation = gets.chomp.downcase

  def power

    puts "Please type first number: "
    first_number = gets.chomp.to_i

    puts "To the power of:"
    second_number = gets.chomp.to_i

    answer = first_number ** second_number

    puts "The answer is #{answer}!"

    puts "Press Enter to continue."
    gets

    end

  def root

    puts "Please type the number you wish to find the root of: "
    first_number = gets.chomp.to_i

    answer = Math.sqrt(first_number)

    puts "The answer is #{answer}!"

    puts "Press Enter to continue."
    gets

    end
 
case operation
when "p"
  power
when "s"
  root
else
  menu
end
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