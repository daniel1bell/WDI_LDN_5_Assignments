require 'pry'

def menu
  
  puts `clear`
  puts "***CalcIt***"
  print "(b)asic, (a)dvanced, or (q)uit: "
  gets.chomp.downcase
end
 
def basic_calc
    print "(a)dd, (s)ubtract, (m)ultiply, (d)ivide: "
  operation = gets.chomp.downcase
 
 if operation == "a" || operation == "s" || operation == "m" || operation == "d"
  print "Enter first number: "
  firstnumber = input_number
  print "Enter second number: "
  secondnumber = input_number
end

puts "The answer is:" 
 
 case operation
  when 'a'
  puts firstnumber + secondnumber
  when 's'
  puts firstnumber - secondnumber
  when 'm'
  puts firstnumber * secondnumber
  when 'd'
  puts firstnumber / secondnumber
else
  puts "You're an idiot, try again!"
  end

puts "Hit any key to continue"
gets

end
 
def advanced_calc
  print "(p)ower, (s)quare root, (m)ortgage , (b)mi , (t)rip: "

  operation = gets.chomp.downcase
 
  if operation == "p" || operation == "s"
    print "Enter first number: "
    firstnumber = input_number
    if operation == "p"
      print "Enter second number: "
      secondnumber = input_number
    end
   end
    
  if operation == "m"
    print "Enter principal amount P: "
    principal_amount = input_number
    print "Enter interest rate i (5% is 5): "
    interest_rate = input_number
    interest_rate = interest_rate / 1200
    puts interest_rate
    print "Enter number of payments n (number of years): "
    number_of_payments = input_number
    number_of_payments = number_of_payments * 12
    puts number_of_payments
  end

  if operation == "b"
    puts "Do you want metric 'm' or imperial 'i'?"
    unit = gets.chomp
    if unit == "m"
      print "Enter your weight in kg: "
      your_weight = input_number
      puts your_weight
      print "Enter your height in cm: "
      your_height = input_number
      puts your_height
      bmi_result = your_weight / (your_height / 100.0)**2
    elsif unit == "i"
      print "Enter your weight in pounds: "
      your_weight = input_number
      puts your_weight
      print "Enter your height in inches: "
      your_height = input_number
      puts your_height
      bmi_result = (your_weight / (your_height)**2) * 703
    else
      print "Invalid choice"
      bmi_result = "Invalid choice"
    end
  end

  if operation == "t"
    print "Distance to destination in miles: "
    trip_distance = input_number
    puts trip_distance
    print "Fuel efficiency of your car MPG: "
    fuel_efficiency = input_number
    puts fuel_efficiency
    print "What is the price of fuel per gallon $PG: "
    price_fuel = input_number
    puts price_fuel
    print "What is your driving speed in MPH: "
    trip_speed = input_number
    puts trip_speed
    
    if trip_speed > 60
      fuel_efficiency = fuel_efficiency - (trip_speed - 60) * 2
    end

    trip_result = "The duration of your trip is #{(trip_distance / trip_speed).round(2)} hours and it will cost you #{((trip_distance / fuel_efficiency) * price_fuel).round(2)} dollars."
  end

puts "The answer is:" 

case operation
  when 'p'
  puts firstnumber ** secondnumber
  when 's'
  puts Math.sqrt(firstnumber)
  when 'm'
  puts principal_amount * (interest_rate*(1+interest_rate)**number_of_payments) / ((1+interest_rate)**number_of_payments - 1)
  when 'b'
  puts bmi_result
  when 't'
  puts trip_result
  else
  puts "You're joking... try again!"
end
 

puts "Hit any key to continue"
gets

end

 def input_number
  gets.chomp.to_f
 end

 
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