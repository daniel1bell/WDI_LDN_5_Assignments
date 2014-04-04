# Function definitions first

require "pry"
def menu
  # Clear the screen, and present the user with a menu
  puts `clear`
  puts "***Scott's Menu Happy Calc***"
  print "(b)asic, (a)dvanced, (m)ortgage, bm(i), (t)rip (q)uit: "
  gets.chomp.downcase
end

def run_again?
  puts "whould you like to run again (y/n?)"
  gets.chomp == "y"
end
# def number_1
#  # ask for the first number
#  print "First Number? "
#  num1 = gets.chomp.to_f
# end

#  def number_2
#    # ask for the second number
#    print "Second Number? "
#    num2 = gets.chomp.to_f
# end

def basic_calc
  print "(a)dd, (s)ubtract, (m)ultiply, (d)ivide: "
  operation = gets.chomp.downcase
  print "first number: "
  a = gets.to_f
  print "second number: "
  b = gets.to_f

  case operation
  when 'a'
    puts "#{a + b}"
  when 's'
    puts "#{a - b}"
  when 'm'
    puts "#{a * b}"
  when 'd'
    puts "#{a / b}"
  end

  gets
end

def advanced_calc
  print "(p)ower, (s)qrt: "
  operation = gets.chomp.downcase
  print "first number: "
  a = gets.to_f

  if operation == 's'
    puts "#{Math.sqrt(a)}"
  else
    print "second number: "
    b = gets.to_f
    puts "#{a**b}"
  end

  gets
end

def mort_calc
  print "How much is your house?"
  house = gets.chomp.to_i
  print "How long is the loan? (months)"
  months = gets.chomp.to_i
  print "What is the interest rate?"
  rate = gets.chomp.to_f
  rate/100

  looked_up_math = (1+rate/12)**(12/12)-1
  annuity = (1-(1/(1+looked_up_math))**months)/looked_up_math
  #credit to google for giving me that calculation

  payment = house/annuity

  puts "You will pay #{payment} per month"
end

def bmi_calc
  print "How tall are you in meters?"
  height = gets.to_f
  print "How much to you weigh in kgs?"
  weight = gets.to_f

  yourbmi = "%.1f" % (weight / (height * height))
  #totally looked up the math again
puts "Your BMI is #{yourbmi}"
end

def trip_calc
  print "How far will you drive in miles?"
  distance = gets.to_f
  print "what is the MPG of your car?"
  mpg = gets.to_f
  print "what is the price per gallon of fuel?"
  gas_cost = gets.to_f
  print "How fast do plan on driving in MPH?"
  speed = gets.to_f

  binding.pry

  trip_time = distance / speed
  money_paid = (gas_cost * mpg) * distance

  puts "Your trip will take #{trip_time} hours and cost you $ #{money_paid}."

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
    mort_calc
  when 'i'
    bmi_calc
  when 't'
    trip_calc
  end

  # if runagain?
  #   response = menu
  # else
  #   response = 'q'
  # end

  response = run_again? ? menu : 'q'

end


