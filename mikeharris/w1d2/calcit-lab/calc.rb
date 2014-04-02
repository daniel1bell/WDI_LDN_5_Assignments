# Function definitions first
def menu
  # Clear the screen, and present the user with a menu
  puts `clear`
  puts "***CalcIt - Noor, Paul and Mike's completely awesome calculator***"
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
   puts "You're an idiot - try again"  
  end

  puts "Hit enter to continue"
  gets


end


def advanced_calc
  # ask the user which operation they want to perform
  print "(p)ower or (s)quare root: "
  operation = gets.chomp.downcase
  
  if operation == "s" 
    print "Enter number that you want to find the root of (not square it!): "
    first_number = input_number
    puts "The answer is"
  end

  if operation == "p" 
    print "Enter first number: "
    first_number = input_number

    print "Enter second number: " 
    second_number = input_number

    puts "The answer is"
  end

  
  


  case operation
  when 'p'
    puts first_number ** second_number
  when 's'
    puts Math.sqrt(first_number) 
  else
    puts "You really are an idiot - please try again."
  
  end

  puts "Hit enter to continue"
  gets


end


def input_number

  gets.chomp.to_f

end

# def mortgage_calc
#   print("Input the mortgage principal")
#   principal = input_number
#   print("Input the yearly interest rate as a number( 7% is 7")
#   yearly_interest_rate = input_number /100 /12
#   print("Input the number of years")
#   number_of_payments = input_number * 12

#   monthly_payment = principal * yearly_interest_rate  * ((1 + yearly_interest_rate)**number_of_payments) / ((1 + yearly_interest_rate)**number_of_payments - 1)

#   print monthly_payment



# end








# run the app...

mortgage_calc
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

