require "pry"

# Function definitions first
def menu
  # Clear the screen, and present the user with a menu
  puts `clear`
  puts "***CalcIt - Paul´s completely awesome calculator***"
  print "(b)asic, (a)dvanced, (m)ortgage, bm(i), (t)rip or (q)uit: "
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

def mortgage 
  puts "Input the mortgage principal: "
  principal = input_number
  puts "Input the yearly interest rate you assume (for 5% input 5): "
  yearly_interest_rate = input_number
  yearly_interest_rate = yearly_interest_rate / 1200
  puts "Input the number of years you assume to repay: "
  number_of_years = input_number
  number_of_years = number_of_years * 12

  monthly_payment = principal * yearly_interest_rate * ((1 + yearly_interest_rate)**number_of_years) / ((1 + yearly_interest_rate)**number_of_years -1)

  puts "Your monthly mortgage payment is #{monthly_payment.round(2)} GBP."

  puts "Hit enter to continue"
  gets

end

def bmi
  puts "Do you want to use the imperial system (input: imperial) or the metric system (input: metric)?"
  bmi_input = gets.chomp.to_s

  if bmi_input == "imperial"
    puts "Input your height in inches: "
    height = input_number
    puts "Input your weight in lbs (and don´t cheat): "
    weight = input_number
    body_mass_index_imperial = (weight / (height**2)) * 703
    puts "Your body mass index is #{body_mass_index_imperial.round(2)}." 
  elsif bmi_input == "metric"
    puts "Input your height in m and use . as a comma: "
    height = input_number
    puts "Input your weight in kg (and don´t cheat): "
    weight = input_number
    body_mass_index_metric = weight / (height**2)
    puts "Your body mass index is #{body_mass_index_metric.round(2)}." 
  else puts "Invalid input: input either imperial or metric."
  end

  puts "Hit enter to continue"
  gets

end

def trip
  puts "Input the distance you want to go in miles: "
  distance = input_number
  puts "Input the fuel efficiency of your car in mpg: "
  fuel_efficiency = input_number
  puts "Input the gas costs per gallon in GBP: "
  gas_cost_per_gallon = input_number
  puts "Input your average speed in miles per hour: "
  speed = input_number
    if speed > 60
      fuel_efficiency - ((speed - 60) * 2)
    end

  duration = distance / speed
  cost = gas_cost_per_gallon * (distance / fuel_efficiency)

  puts "Your trip will take #{duration.round(2)} hours and costs GBP #{cost.round(2)}."

  puts "Hit enter to continue"
  gets

end


# run the app...

response = menu

while response != 'q'
  case response
  when 'b'
    basic_calc
  when 'a'
    advanced_calc
  when 'm'
    mortgage
  when 'i'
    bmi
  when 't'
    trip      
  end

  response = menu
end