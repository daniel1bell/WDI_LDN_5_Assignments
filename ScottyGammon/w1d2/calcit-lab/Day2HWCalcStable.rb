# Function definitions first
def menu
  # Clear the screen, and present the user with a menu
  puts `clear`
  puts "***CalcIt***"
  print "(b)asic, (a)dvanced, (s)ituationor (q)uit: "
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
  print = "What is the interest rate?"
  rate = gets.chomp.to_f
  rate / 100

  looked_up_math = (1+rate/12)**(12/12)-1
  annuity = (1-(1/(1+looked_up_math))**months)/looked_up_math

  payment = house/annuity

  puts "You will pay #{payment} per month"
end

# run the app...

response = menu

while response != 'q'
  case response
  when 'b'
    basic_calc
  when 'a'
    advanced_calc
  when 's'
    mort_calc
  end

  # if runagain?
  #   response = menu
  # else
  #   response = 'q'
  # end

  response = run_again? ? menu : 'q'

end


