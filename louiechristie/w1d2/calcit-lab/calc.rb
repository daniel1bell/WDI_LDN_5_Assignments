require 'pry'

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
  operation = gets.chomp.strip.downcase

  print "First Number? "
  num1 = gets.chomp.to_f
  print "Second Number? "
  num2 = gets.chomp.to_f

  case operation
  when "a"
    puts  num1 + num2
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
  print "(p)ower, (s)quare root, (m)ortgage calculation, (b)mi, (t)rip: "
  operation = gets.chomp.downcase

  case operation

  when "p"
    print "First Number? "
    num1 = gets.chomp.to_f
    print "Second Number? "
    num2 = gets.chomp.to_f
    puts  num1** num2
  when "s"
    print "Number to be square rooted? "
    num1 = gets.chomp.to_f
    puts Math.sqrt(num1)
  when "m"
    print "Principal? "
    principal = gets.chomp.to_f
    print "Yearly interest rate in %? "
    interest_rate = gets.chomp.to_f
    monthly_interest_rate = (interest_rate/100)/12
    print "Number of monthly payments? "
    number_of_payments = gets.chomp.to_f
    # M = P[i(1+i)^n]/[(1+i)^n -1] from http://www.wikihow.com/Calculate-Mortgage-Payments
    monthly_payment = principal * (monthly_interest_rate * (1 + monthly_interest_rate)**number_of_payments)  /  ( (1 + monthly_interest_rate)**number_of_payments - 1)
    puts "Monthly payment is #{monthly_payment}"
  when "b"
    print "(m)etric or (i)mperial? "
    if gets.chomp == "m"
      print "Height in meters? "
      metric_height = gets.chomp.to_f
      print "Weight in kg? "
      metric_weight = gets.chomp.to_f
    else
      print "Height in feet (inches next question)? "
      feet = gets.chomp.to_f
      print "and in inches? "
      inches = gets.chomp.to_f
      metric_height = (feet * 30.48 + inches * 2.54) / 100
      print "Weight in stone? "
      stone = gets.chomp.to_f
      metric_weight = stone * 6.35029
    end

    bmi = metric_weight/((metric_height)**2)
    puts "bmi is #{bmi}"

  when "t"
    print "distance, how far will you drive? "
    distance = gets.chomp.to_f
    print "MPG, fuel efficiency of the car? "
    mpg = gets.chomp.to_f
    print "$PG, how much does gas cost per gallon? "
    cpg = gets.chomp.to_f
    print "Speed, how fast will you drive? "
    speed = gets.chomp.to_f

    binding.pry

    if speed >= 60
      reduce = 2 * (speed - 60)
      mpg = mpg - reduce
    end
    hours = distance / speed
    cost =  (distance / mpg) * cpg
    puts "Your trip will take #{hours} hours and cost #{cost}"
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

  puts "Hit enter to continue..."
  gets
  response = menu
end