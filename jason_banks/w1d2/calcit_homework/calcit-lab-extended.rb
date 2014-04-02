require "pry"

# Function definitions first

def is_a_number(s)
  s.to_s.match(/\A[+-]?\d+?(\.\d+)?\Z/) == nil ? false : true
end

def number_get_and_confirm
  puts "Please enter the number: "
  number = gets.chomp
  while !is_a_number(number)
    puts "Please enter a number: "
    number = gets.chomp
  end
  number.to_f
end

def menu
  # Clear the screen, and present the user with a menu
  puts `clear`
  puts "***CalcIt***"
  print "(b)asic, (a)dvanced, (o)ther or (q)uit: "
  operation = gets.chomp.downcase
  while operation != "b" && operation != "a" && operation != "o" && operation != "q"
    puts "Invalid. Please choose (b)asic, (a)dvanced, (o)ther or (q)uit: "
    operation = gets.chomp.downcase
  end
  operation

end

def basic_calc
  # ask the user which operation they want to perform
  print "(a)dd, (s)ubtract, (m)ultiply, or (d)ivide: "
  operation = gets.chomp.downcase
  while operation != "a" && operation != "s" && operation != "m" && operation != "d"
    puts "Invalid. Please choose (a)dd, (s)ubtract, (m)ultiply, or (d)ivide: "
    operation = gets.chomp.downcase
  end

  puts "First Number"
  num1 = number_get_and_confirm
  puts "Second Number"
  num2 = number_get_and_confirm

  case operation
  when "a"
    puts num1 + num2
  when "s"
    puts num1 - num2
  when "m"
    puts num1 * num2
  when "d"
    puts num1 / num2
  end
end

def advanced_calc
  # ask the user which operation they want to perform
  print "(p)ower, or (s)quare root: "
  operation = gets.chomp.downcase
  while operation != "p" && operation != "s"
    puts "Invalid. Please choose (p)ower, or (s)quare root: "
    operation = gets.chomp.downcase
  end

  case operation
  when "p"
    print "First Number? "
    num1 = gets.chomp.to_f
    print "Second Number? "
    num2 = gets.chomp.to_f
    puts num1**num2
  when "s"
    print "Number to be square rooted? "
    num1 = gets.chomp.to_f
    puts Math.sqrt(num1)
  end
end

def other_calcs
  print "(m)ortgage, (b)mi, or (t)rip: "
  operation = gets.chomp.downcase
  while operation != "m" && operation != "b" && operation != "t"
    puts "Invalid. Please choose (m)ortgage, (b)mi, or (t)rip: "
    operation = gets.chomp.downcase
  end

  case operation
  when "m"
    mortgage_calc
  when "b"
    bmi_calc
  when "t"
    trip_calc
  else
    puts "Please choose one of the provided operations."
  end
end

def mortgage_calc
  puts "Principal"
  principal = number_get_and_confirm
  puts "Interest rate"
  interest = (number_get_and_confirm / 100) / 12
  puts "Number of payments"
  number_of_payments = number_get_and_confirm
  monthly = principal * ((interest * ((1 + interest)**number_of_payments)) / (((1 + interest)**number_of_payments) - 1))
  puts "Your monthly payment is #{monthly}."
end

def bmi_calc
  puts "(m)etric, or (i)mperial: "
  operation = gets.chomp.downcase
  while operation != "m" && operation != "i"
    puts "Invalid. Please choose (m)etric, or (i)mperial: "
    operation = gets.chomp.downcase
  end

  case operation
  when "m"
    puts "Mass (in kg)"
    mass = number_get_and_confirm
    puts "Height (in m)"
    height = number_get_and_confirm
    bmi_total = (mass / (height**2)).round(2)
  when "i"
    puts "Mass (in lbs)"
    mass = number_get_and_confirm
    puts "Height (in in)"
    height = number_get_and_confirm
    bmi_total = ((mass / (height**2)) * 703).round(2)
  end
  
  puts "Your BMI is #{bmi_total}."
end

def trip_calc
  puts "Distance"
  distance = number_get_and_confirm
  puts "Vehicle efficiency (mpg)"
  mpg_of_vehicle = number_get_and_confirm
  puts "Cost of gas per gallon (in dollars)"
  cost_of_gas = number_get_and_confirm
  puts "Expected average speed (mph)?"
  speed = number_get_and_confirm
  if speed > 60
    mpg_of_vehicle = mpg_of_vehicle - (2 * (speed - 60))
  end
  trip_time = (distance / speed).round(2)
  trip_cost = ((distance / mpg_of_vehicle) * cost_of_gas).round(2)
  puts "Your trip will take #{trip_time} hour(s) and cost #{trip_cost}."
end



# run the app...

response = menu

while response != "q"

  case response
  when "b"
    basic_calc
  when "a"
    advanced_calc
  when "o"
    other_calcs
  end

puts "Hit enter to continue..."
gets


response = menu
end