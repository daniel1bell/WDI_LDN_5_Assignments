# Function definitions first
def menu
  # Clear the screen, and present the user with a menu
  puts `clear`
  puts "***CalcIt***"
  print "(b)asic, (a)dvanced, or (q)uit: "
  gets.chomp.downcase # Return
end
 
def basic_calc
  # ask the user which operation they want to perform
  print "(a)dd, (s)ubtract, (m)ultiply, (d)ivide: "
  operation = gets.chomp.downcase
  
  def add
    puts "please type first number: "
    first_number = gets.chomp.to_f
    puts "please type second number: "
    second_number = gets.chomp.to_f
    answer = first_number + second_number
    puts "The sum is #{answer}"
    puts "Press any key to continue"
    gets
  end

  def subtract
    puts "please type first number: "
    first_number = gets.chomp.to_f
    puts "please type second number: "
    second_number = gets.chomp.to_f
    answer = first_number - second_number
    puts "The difference is #{answer}"
    puts "Press any key to continue"
    gets
  end

  def multiply
    puts "please type first number: "
    first_number = gets.chomp.to_f
    puts "please type second number: "
    second_number = gets.chomp.to_f
    answer = first_number * second_number
    puts "The product is #{answer}"
    puts "Press any key to continue"
    gets
  end

  def divide
    puts "please type first number: "
    first_number = gets.chomp.to_f
    puts "please type second number: "
    second_number = gets.chomp.to_f
    answer = first_number / second_number
    puts "The quotient is #{answer}"
    puts "Press any key to continue"
    gets
  end

  case operation
    when 'a'
      add
    when 's'
      subtract
    when 'm'
      multiply
    when 'd'
      divide
    else menu
  end
end
# run the app...

def advanced_calc
  print "(p)ower, (s)quare root: "
  operation = gets.chomp.downcase

  def power
    puts "please type first number: "
    first_number = gets.chomp.to_f
    puts "please type second number: "
    second_number = gets.chomp.to_f
    answer = first_number ** second_number
    puts "The power is #{answer}"
    puts "Press any key to continue"
    gets
  end

  def square_root
    puts "please type number: "
    first_number = gets.chomp.to_f
    answer = Math.sqrt(first_number)
    puts "The square root is #{answer}"
    puts "Press any key to continue"
    gets
  end

  case operation
    when 'p'
    power
    when 's'
    square_root
    else menu
  end
end 

response = menu # Return value of menu
 
while response != 'q'
  case response
  when 'b'
    basic_calc
  when 'a'
    advanced_calc
  end

  response = menu
end