

# Function definitions first
def menu
  # Clear the screen, and present the user with a menu
  puts `clear`
  puts "***CalcIt - Mike's completely awesome calculator***"
  print "(b)asic, (a)dvanced, (m)ortgage, bm(i), (t)rip or (q)uit: "
  gets.chomp.downcase
end

#gets user input and checks it is a number 
def input_number

  user_input = gets.chomp
  
  unless user_input == "0"
    if user_input.to_f == 0 
      print "That is not a number please try again: "  
      user_input = input_number
    end
  end

  user_input.to_f

end

# pause when user gets to the end of a menu 
def pause

  puts "Hit enter to continue"
  gets

end

#the differnt menu options
def basic_calc
  # ask the user which operation they want to perform
  print "(a)dd, (s)ubtract, (m)ultiply, (d)ivide: "
  operation = gets.chomp.downcase
  
  valid_operations = ["a", "s", "m", "d"]

  if valid_operations.include?(operation)
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

  pause

end


def advanced_calc
  # ask the user which operation they want to perform
  print "(p)ower or (s)quare root: "
  operation = gets.chomp.downcase

  case operation
  when 'p'
    print "Enter first number: "
    first_number = input_number

    print "Enter second number: " 
    second_number = input_number

    puts "The answer is"
    
    puts first_number ** second_number
  when 's'
    print "Enter number that you want to find the root of: "
    first_number = input_number
    puts "The answer is"
    puts Math.sqrt(first_number) 
  else
    puts "You really are an idiot - please try again."
  
  end

  pause

end


def mortgage_calc
  print "Input the mortgage principal: "
  principal = input_number
  print "Input the yearly interest rate as a number (7% is 7): "
  yearly_interest_rate = input_number 
  yearly_interest_rate = yearly_interest_rate / 1200

  print "Input the number of years: "
  number_of_payments = input_number 
  number_of_payments = number_of_payments * 12

  monthly_payment = principal * yearly_interest_rate  * ((1 + yearly_interest_rate)**number_of_payments) / ((1 + yearly_interest_rate)**number_of_payments - 1)

  puts "Your monthly mortgage payment is £#{monthly_payment.round(2)}"

  pause

end


def bmi
  print "Would you like (i)mperial or (m)etric? "
  units = gets.chomp.to_s
  valid_units = ["i", "m"]

  if valid_units.include?(units) 
    case units 
    when 'm'
      unit_weight = 'kg'
      unit_height = 'm'
      factor = 1
    when 'i'
      unit_weight = 'lb'
      unit_height = 'in'
      factor = 703
    else 
      
    end


    print "Input your weight (#{unit_weight}): "
    mass = input_number
    print "Input your height (#{unit_height}): "
    height = input_number

    bmi_value = (mass / height ** 2 * factor).round(2)

    puts "Your bmi is #{bmi_value}"

    pause
  else
    puts "Not a valid unit - try again please."
    sleep(1)
    puts "Try reading the question this time."
    sleep(1)
    puts "Or get smaller fingers."
    sleep(1)

    bmi
  end

end


def trip_calculator
   print "How far will you drive (m)? "
   distance = input_number
   print "What is the MPG of the car? "
   mpg = input_number
   print "What is the cost of a gallon of fuel? "
   cost_per_gallon = input_number
   print  "How fast will you drive (mph)? "
   speed =  input_number
    

   mpg = mpg - [0, speed - 60].max * 2

   puts "Your journey will take #{(distance / speed).round(2) } hours and will cost £#{(distance / mpg * cost_per_gallon).round(2)} the mpg is #{mpg}"

   pause
 end

#run the program
response = menu

 while response != 'q'
   case response
   when 'b'
     basic_calc
   when 'a'
     advanced_calc
    when 'm'
      mortgage_calc
    when 'i'
      bmi
    when 't'
      trip_calculator
  end

  response = menu

end

