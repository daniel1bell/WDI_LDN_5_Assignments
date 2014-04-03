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
  operation = gets.chomp.downcase
 
  #ask for the numbers
  if operation == 'a' || operation == 's' || operation == 'm'|| operation == 'd'
    puts "first number:"
    number_one = gets.chomp.to_f
    puts "second number:"
    number_two = gets.chomp.to_f
  else
  result = "Invalid"
  end

  case operation
  when 'a'
    result = number_one + number_two
  when 's'
    result = number_one - number_two
  when 'm'
    result = number_one * number_two
  when 'd'
    result = number_one / number_two    
  end
puts result.to_s
end
 
 #advanced calculation method
 def advanced_calc
  print "(p)ower, (s)quare root, (m)ortgage calculator, (b)mi index, (t)rip calculator: "
  operation = gets.chomp.downcase

  case operation
  when 'p'
    puts "first number:"
    number_one = gets.chomp.to_f
    puts "second number:"
    number_two = gets.chomp.to_f
    result = number_one ** number_two
    puts result.to_s

  when "s"
    puts "first number"
    number_one = gets.chomp.to_f
    result = Math.sqrt(number_one)
    puts result.to_s

#mortgage
  when "m"
    puts "What is your principal amount?"
    p = gets.chomp.to_f
    puts "What is your interest rate in %?"
    i = gets.chomp.to_f * 0.01 / 12
    puts "How many payments will you make?"
    n = gets.chomp.to_f
    result = p * (( i * ( (1 + i)**n) ) / ( ( (1 + i)**n) - 1 ))

    puts "Your monthly payment is #{result.round(2)}"

#BMI
  when "b"
    puts "To calculate your BMI, we will ask you for your weight and height."

    #asking for weight
    puts "Would you like to give your weight in (k)ilograms or (l)bs?"
    weight_system = gets.chomp
    while (weight_system != 'k' && weight_system != 'l')
      puts "Invalid - Please enter k or l"
      weight_system = gets.chomp
    end
    if weight_system == 'k'
      puts "Please enter your weight in kilos"
      weight = gets.chomp.to_f
    elsif weight_system == 'l'
      puts "Please enter your weight in lbs"
      weight = gets.chomp.to_f * 0.453592
    end

    #asking for height
    puts "Would you like to give your height in (m)eters or in (f)eet?"
    height_system = gets.chomp
    while (height_system != 'f' && height_system != 'm')
      puts "Invalid - Please enter m or f"
      height_system = gets.chomp
    end

    if height_system == 'm'
      puts "Please enter your height in meters"
      height = gets.chomp.to_f

    elsif height_system == 'f'
      puts "We will ask you how many feet and how many inches you measure"
      puts "How many feet?"
      feet = gets.chomp.to_f
      puts "How many inches?"
      inches = gets.chomp.to_f
      height = feet * 0.3048 + inches * 0.0254
    end

    #calculating the BMI
    result = weight / ((height)**2)
    puts "Your BMI index is #{result.round(2)}"

# Trip calculator
  when 't'
    puts "How far do you want to drive?"
    miles = gets.chomp.to_f

    puts "how fast will you drive (in MPH)?"
    speed = gets.chomp.to_f

    puts "what is the fuel efficiency of the car? (in MPG)"
    if speed < 61
    miles_per_gallon = gets.chomp.to_f
    else miles_per_gallon = gets.chomp.to_f - ((speed - 60) * 2)
    end
    miles_per_gallon = 1 if miles_per_gallon < 1

    puts "how much does gas cost per gallon?"
    cost_per_gallon = gets.chomp.to_f
    binding.pry

    time = miles / speed
    cost = miles / miles_per_gallon * cost_per_gallon

    puts "Your trip will take #{time.round(2)} hours and cost $#{cost.round(2)}."



  else
    result = "Invalid"
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
  else
    puts "Invalid, type something else"
  end
  puts "press any key to go back to the menu"
  gets
  response = menu
end