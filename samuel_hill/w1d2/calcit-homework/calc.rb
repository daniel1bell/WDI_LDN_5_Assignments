require 'pry'

def menu
  # Clear the screen, and present the user with a menu
  puts `clear`
  puts "*** My Calculator ***"
  print "(b)asic, (a)dvanced, (m)ortgage, (z)bmi, (t)ravel or (q)uit: "
  gets.chomp.downcase
end

def basic_calc
	# ask the user which operation they want to perform
  print "(a)dd, (s)ubtract, (m)ultiply, (d)ivide: "
  operation = gets.chomp.downcase

	puts "First number: "
	first_number = gets.chomp.to_f

	puts "Second number: "
	second_number = gets.chomp.to_f	

	case operation
		when "a"
  		answer = first_number + second_number
		when "s"
  		answer = first_number - second_number
		when "m"
  		answer = first_number * second_number
		when "d"
  		answer = first_number / second_number
		else
  		menu
		end

	puts "The answer is #{answer}! Press Enter to continue."
	gets
end

def advanced_calc
	# ask the user which operation they want to perform
  print "(p)ower, (r)oot: "
  operation = gets.chomp.downcase

  case operation
  	when "p"
  	puts "Please enter a number: "
  	first_number = gets.chomp.to_f
  	puts "To the power of: "
  	second_number = gets.chomp.to_f
  	answer = first_number ** second_number
  	when "r"
  	puts "Please enter a number you want to find the square root for: "
  	first_number = gets.chomp.to_f
  	answer = Math.sqrt(first_number)
  	else
  	menu
  	end

  	puts "The answer is #{answer}! Press Enter to continue."
  	gets
end

def mortgage_calc
	puts "Please enter the amount you wish to loan: "
	loan_amount = gets.chomp.to_f
	puts "Please enter the number of years that you wish to repay the mortgage: "
	loan_time = gets.chomp.to_f
	puts "Please enter the annual rate of interest: "
	annual_interest_rate = gets.chomp.to_f / 100

	monthly_interest_rate = annual_interest_rate / 12
	number_of_payments = loan_time * 12
	loan_term = (1 + monthly_interest_rate) ** number_of_payments

	monthly_payments = loan_amount * (monthly_interest_rate * loan_term) / (loan_term - 1)

	puts "The total monthly repayment is #{monthly_payments}! Press Enter to continue."
	gets	
end	

def bmi_calc
	puts "Would you like to use (m)etric or (i)mperial?"
	operation = gets.chomp.downcase

	def metric
	puts "Please enter your height in metres: "
	height = gets.chomp.to_f
	puts "Please enter your weight in kg: "
	weight = gets.chomp.to_f
	bmi = weight / (height * height)
	puts "Your BMI is #{bmi}! Please press Enter to continue."
	gets
	end

	def imperial
	puts "Please enter your height in feet: "
	height = gets.chomp.to_f
	puts "Please enter your weight in lbs: "
	weight = gets.chomp.to_f
	bmi = (weight / 2.2046) / ((height / 3.2808) * (height /3.2808))
	puts "Your BMI is #{bmi}! Please press Enter to continue."
	gets
	end

	case operation
	when 'm'
		metric
	when 'i'
		imperial
	end	
end

def travel_calc
	puts "How far will you drive?"
	distance = gets.chomp.to_f
	puts "What is the MPG of the vehicle you are travelling in?"
	mpg = gets.chomp.to_f
	puts "How much does the fuel cost per gallon?"
	fuel_cost = gets.chomp.to_f
	puts "How fast will you drive in MPH?"
	speed = gets.chomp.to_f
	binding.pry
	time = distance / speed
	cost = (distance / mpg) * fuel_cost

	puts "Your trip will take #{time} hours and cost £#{cost}. Press Enter to continue."
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
   	mortgage_calc
  when 'z'
  	bmi_calc
  when 't'
	travel_calc   	 	 
  end
 
  response = menu
end