  
    # Function definitions first
    def menu
  # Clear the screen, and present the user with a menu
  puts `clear`
  puts "***CalcIt***"
  print "(b)asic, (a)dvanced, or (q)uit: "
  gets.chomp.downcase # Return
    end

  #   def basic_calc
  # # ask the user which operation they want to perform
  # print "(a)dd, (s)ubtract, (m)ultiply, (d)ivide: "
  # operation = gets.chomp.downcase
  
  # def add
  #   puts "please type first number: "
  #   first_number = gets.chomp.to_f
  #   puts "please type second number: "
  #   second_number = gets.chomp.to_f
  #   answer = first_number + second_number
  #   puts "The sum is #{answer}"
  #   puts "Press any key to continue"
  #   gets
  # end

  # def subtract
  #   puts "please type first number: "
  #   first_number = gets.chomp.to_f
  #   puts "please type second number: "
  #   second_number = gets.chomp.to_f
  #   answer = first_number - second_number
  #   puts "The difference is #{answer}"
  #   puts "Press any key to continue"
  #   gets
  # end

  # def multiply
  #   puts "please type first number: "
  #   first_number = gets.chomp.to_f
  #   puts "please type second number: "
  #   second_number = gets.chomp.to_f
  #   answer = first_number * second_number
  #   puts "The product is #{answer}"
  #   puts "Press any key to continue"
  #   gets
  # end

  # def divide
  #   puts "please type first number: "
  #   first_number = gets.chomp.to_f
  #   puts "please type second number: "
  #   second_number = gets.chomp.to_f
  #   answer = first_number / second_number
  #   puts "The remainder is #{answer}"
  #   puts "Press any key to continue"
  #   gets
  # end

  # case operation
  # when 'a'
  #   add
  # when 's'
  #   subtract
  # when 'm'
  #   multiply
  # when 'd'
  #   divide
  # else menu
  # end
  #   end
  #   # run the app...

    def advanced_calc
  print "(p)ower, (s)quare root, (b)mi, (t)rip, (m)ortgage "
  operation = gets.chomp.downcase

  def power
    puts "please type first number: "
    first_number = gets.chomp.to_f
    puts "please type second number: "
    second_number = gets.chomp.to_f
    answer = first_number ** second_number
    puts "The power is #{answer}"
    puts "Press any key to continue"
    gets
  end

   def square_root
   puts "please type the number to square root: "
   first_number = gets.chomp.to_f
   answer = Math.sqrt(first_number)
   puts "The square root is #{answer}"
   puts "Press any key to continue"
   gets
  end

  def mortgage
   puts "Please enter your mortgage amount"
   mortgage_amount = gets.chomp.to_f
   
   puts "Please enter the number of payments"
   number_of_payments = gets.chomp.to_i

   puts "Please enter your annual interest rate"
   interest = gets.chomp.to_f / 100

   monthly_interest = interest / 12
   loan_term = (1 + monthly_interest) ** number_of_payments

  payment = mortgage_amount * (monthly_interest * loan_term) / (loan_term - 1)

  puts "The total monthly repayment is #{payment}! Press Enter to continue."
  
  end


    def trip
   puts "How far are you planning to travel in miles?"
   distance = gets.chomp.to_f
   puts "What is the MPG average of the car?"
   mpg = gets.chomp.to_f
   puts "How much does gas cost per gallon?"
   gas = gets.chomp.to_i
   puts "What will your average speed be in MPH"
   mph = gets.chomp.to_i
   puts "Your trip will take around #{distance/mph} hours and will cost around #{distance/mph * gas}."
   puts "Press any key to continue"
   gets
  end

  def bmi


# Underweight = <18.5

# Normal weight = 18.5-24.9

# Overweight = 25-29.9

# Obesity = BMI of 30 or greater

    puts "Would you like to calculate your BMI in lbs or kg?"
    weight = gets.chomp

    if weight == "lbs"
      puts "what is your weight?"
      lbs = gets.chomp.to_i

      puts "what is your height in cm's?"
      height = gets.chomp.to_f * 2

      puts "Your BMI is #{lbs/height} and you are"
         puts "Press any key to continue"
   gets


   elsif weight == "kg"
    puts "What is your weight?"
    kg = gets.chomp.to_i

    puts "What is your height in cm's?"
    height = gets.chomp.to_f * 2

    puts "Your BMI is #{kg/height} and you are #{bmi_result}"
       puts "Press any key to continue"
       gets

    end

# bmi_result = case
#   when bmi > 40               : "morbidly obese"
#   when (31..40).include?(bmi) : "obese"
#   when (26..30).include?(bmi) : "overweight"
#   when (19..25).include?(bmi) : "optimal"
#   when bmi == 18              : "underweight" # this seems like too narrow a band of values
#   when bmi < 17               : "anorexic"
#   else                        : "not a number"
# end

    
  end

  case operation
  when 'p'
    power
  when 's'
    square_root
  when 'b'
    bmi
  when 't'
    trip
  when 'm'
    mortgage
  # when 'lbs'
  #   lbs
  # when 'kg'
  #   kg
  #when 'weight'
   # weight
 
  else menu
  end

end 

    response = menu # Return value of menu

    while response != 'q'
  case response
  when 'b'
    basic_calc
  when 'a'
    advanced_calc
  end
gets
  response = menu
    end

  