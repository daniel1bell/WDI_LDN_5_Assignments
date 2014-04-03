# Function definitions first
def menu
  # Clear the screen, and present the user with a menu
  puts `clear`
  puts "***CalcIt***"
  print "(b)asic; (a)dvanced; (s)uper advanced or (q)uit: "
  gets.chomp.downcase
end

   
  def get_number
    def is_a_number?(s)
      s.to_s.match(/\A[+-]?\d+?(\,\d+)?+?(\.\d+)?\Z/) == nil ? false : true 
    end
    number = gets.chomp
    while !is_a_number?(number)
      puts "Can you enter a number please?"
      number=gets.chomp
    end
    number.to_f
  end
 

def basic_calc
  # ask the user which operation they want to perform
  print "(a)dd, (s)ubtract, (m)ultiply, (d)ivide: "
  operation = gets.chomp.downcase

case operation
when "a"
  puts "Enter a number: "
  num1 = get_number
  puts "Enter a number to add to #{num1}: "
  num2 = get_number
  puts  "= #{num1 + num2}"
when "s"
  puts "Enter a number: "
  num1 = get_number
  puts "Enter a number to subtract from #{num1}: "
  num2 = get_number
  puts  "= #{num1 - num2}"
when "m"
  puts "Enter a number to multiply: "
  num1 = get_number
  puts "Enter a number to multiply #{num1} by: "
  num2 = get_number
  puts  "= #{num1 * num2}"
when "d"
  puts "Enter a number to divide: "
  num1 = get_number
  puts "Enter a number to divide #{num1} by: "
  num2 = get_number
  puts  "= #{num1 / num2}"
else
  puts "That's not a valid response. Please start again."
end

end

def advanced_calc
  # ask the user which operation they want to perform
  print "(p)ower, (s)quare root: "
  operation = gets.chomp.downcase

case operation

when "p"
  puts "Enter a number to start from: "
  num1 = get_number
  puts "What do you want to find the power of #{num1} to? "
  num2 = get_number
  puts  "= #{num1** num2}"
when "s"
  print "Number to be square rooted? "
  num1 = get_number
  puts "= #{Math.sqrt(num1)}"
else
  puts "Please provide a valid response."
end

end


def super_advanced_calc
  # ask the user which operation they want to perform
  print "(m)ortgage calculator; (b)mi calculator; (t)rip calculator "
  operation = gets.chomp.downcase

case operation

when "m"
  
  puts "\n 
  Welcome to the mortgage calculator! \n
  We'll need you to have the following information available: the Principal Amount; the Interest Rate and the Number of Payments you want to set the mortgage over. \n
  We'll give you back the monthly payment you'll need to make. \n \n"
  
  puts "What is your 'Principal Amount'?  "
  print "£"
  p_amount = get_number
  puts "What is your interest rate?"
  print "(%) "
  
  #  The annual interest rate.
  i_rate = get_number/100
  #  The monthly interest rate.
  m_i_rate = i_rate / 12.0

  # The number of monthly payments.
  puts "What is the life of the loan?"
  print "(years) "
  n_payments = get_number * 12
  
  # The answer.
  puts
  puts "-------------------------------"
  puts
  puts "You will make #{n_payments.round(0)} monthly payments."
  monthly_payments = p_amount * ((m_i_rate * ((1 + m_i_rate)) ** n_payments)/(((1 + m_i_rate) ** n_payments) - 1))
  puts "Your monthly payments will be £#{monthly_payments.round(2)}"
  puts
  puts "-------------------------------"
  puts

# start the code for the BMI calculator

when "b"

    puts "\n
    Welcome to the Body Mass Index (BMI) calculator! \n
    Let's find out whether you're a chubby funster or if you're  a slim jim. \n\n"

#  ask whether they'd like to supply info in metric or imperial and ask for inputs for WEIGHT


    print "Would you like to enter your WEIGHT in (m)etric or (i)mperial?   "
    w_measure = gets.chomp.downcase
    puts

    case w_measure

    when "m"
      print "What weight are you? (kg)    "
      weight = get_number
      puts

    when "i"
      print "What weight are you? (lb)    "
      weight = get_number*0.453592
      puts

    else
      puts "Please provide a valid response"
      puts "Press Enter to try again."
      gets
      super_advanced_calc
  end

#  ask whether they'd like to supply info in metric or imperial and ask for inputs for HEIGHT

    print "Would you like to enter your HEIGHT in (m)etric or (i)mperial?   "
    h_measure = gets.chomp.downcase
    puts
    
    case h_measure

    when "m"
      print "What height are you? (cm)    "
      height = get_number/100
      puts

    when "i"
      print "What height are you? (inches)    "
      height = get_number/0.393700787/100
      puts

    else
      puts "Please provide a valid response"
  end

# calculate and give the output of that bmi calculation

  puts
  puts "-------------------------------"
  puts "You are #{weight.round(1)} kg and #{height.round(2)} m tall."
  puts
  bmi = weight / (height **2)
  puts "This gives you a BMI of #{bmi.round(2)}."
  puts

 #  give a prognosis and advice relating to the bmi calculated
  
  puts "PROGNOSIS"
   
    if bmi.between?(0, 18.5)
      puts "Underweight- Oooooh, skinny mini! It's time for you to look at trying to have some bigger lunches."
      elsif bmi.between?(18.5, 25)
        puts "Normal-  Aah, a plain Jane. Looks like you're on the right track, keep up the good work!"
      elsif bmi.between?(25, 30)
        puts "Overweight-  Hey, you're cutting it close there. Maybe take the stairs from now on."
      elsif bmi.between?(30, 100)
        puts "Obese-  Dial 111 as soon as possible."
      else
        puts "It looks like you might have put in some incorrect numbers somewhere. Maybe try again?"
    end
  puts
  puts "-------------------------------"

# start the code for the trip calculator

when "t"

  puts "\n
    Welcome to the Trip Calculator! \n
    We'll ask you for some information and tell you how long your trip will take and how much it should cost you in fuel. \n\n"

# get the input figures for distance, MPG, £PG and speed.

 print "Would you like to give me the distance of your journey in (m)iles or (k)ilometres?    "
  dist_measure = gets.chomp.downcase
  case dist_measure
    when "m"
      print "How far will you drive? (miles)    "
      distance = get_number
    when "k"
      print "How far will you drive? (km)    "
      distance = get_number * 0.621371192
    else
      print "That's not a valid response. Please start again."
  end

  print "What is the fuel efficiency of your car? (MPG)   "
  f_efficiency = get_number

  print  "How much does your fuel cost you? (pence per litre)   "
  f_cost = get_number / 100

  print "What will be your average speed? (MPH)   "
  speed = get_number.to_i

# reduce the fuel efficieny should the vehicle be travelling faster than 60mph

  if speed > 60
    f_efficiency = f_efficiency - ((speed - 60) * 2)
  end

  if f_efficiency < 1
    f_efficiency = 1
  end

# put the answer

  puts
  puts "-------------------------------"
  time = distance / speed
  cost = (distance / f_efficiency) * (f_cost * 4.54609188)
  puts "Your trip will take #{time.round(1)} hours and will cost you £#{cost.round(2)}."
  puts
  puts "-------------------------------"


else
  puts "That's not a valid response. Please start again."
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
  when 's'
      super_advanced_calc
  else
    puts "That's not a valid response. Please start again."
  end

puts "Hit enter to continue..."
gets


response = menu
end

