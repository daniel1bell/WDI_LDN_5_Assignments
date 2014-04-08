# Function definitions first
require 'pry'

def is_a_number(s)
  s.to_s.match(/\A[+-]?\d+?(\.\d+)?\Z/) == nil ? false : true
end

def number_check(s, method)
  check = is_a_number(s)
  puts "That's not a number, try again." if check == false
  method if check = true
end

def menu
  # Clear the screen, and present the user with a menu
  puts `clear`
  puts "***CalcIt***"
  print "(b)asic, (a)dvanced, (f)unky or (q)uit: "
  gets.chomp.downcase
end
 
def funky_calc
  # ask the user which operation they want to perform
  print "(m)ortgage, (b)mi, (t)rip: "
  gets.chomp.downcase
end
  
def mortage
  puts "Let's estimate your monthly mortage payment."
  puts "How much do you want to borrow?"
    principal = gets.chomp.to_i
  puts "What is the interest rate?"
  rate = gets.chomp.to_f / 100 / 12
  puts "How long (in years) do you want the mortage to be?"
  payments = gets.chomp.to_i * 12
  # insert magic incatation here....
  monthly_payment = principal * ((rate * (1 + rate) ** payments)/((1 + rate)**payments - 1))
  puts "If you borrow £#{principal} at an annual interest rate of #{(rate *100*12).round(2)}%"
  puts "and the term of your loan is #{payments / 12} years,"
  puts "your monthly morgage payment will be £#{monthly_payment}." 
end

def trip 
  time = 0.0 / 0.0
  cost = 0.0 / 0.0
  puts "Let's figure out how much a car trip will cost you."
  while time.nan? or cost.nan?
    puts "How far will you drive in miles?"
    distance = gets.chomp.to_f
    puts "How fast will you drive in MPH?"
    speed = gets.chomp.to_f
    puts "What is the fuel efficiency of your car in MPG?"
    mpg = [5, (gets.chomp.to_f - (speed - 60 * 2))].min
    puts "What is the cost of petrol in $ per gallon?"
    price = gets.chomp.to_f
    puts "You're a nut job.  I'm not getting in your car" if speed >= 100
    binding.pry
    time = (distance / speed).round(1)
    cost = (distance / mpg * price)
    binding.pry
    puts "All your inputs must be numbers.  Don't mess with me by trying to enter" if time.nan? or cost.nan?
    puts "'cucumber' for distance or some such nonsense.  Try again." if time.nan? or cost.nan?
  end
  puts "Your trip will take #{time} hours and will cost $#{cost.to_i}."

end

def bmi
  puts "Do you measure your height in weight under the (i)mperial system or the (m)etric system?"
  system = gets.chomp
  if system != "i" and system != "m"
    puts "invalid"
  else
    puts "Great. Let's see if you're a fatso."
    puts "how tall are you in #{system == 'm' ? 'metres' : 'inches'}?"
    height = gets.chomp.to_f
    puts "how much do you weight in #{system == 'm' ? 'kilograms' : 'pounds'}?"
    weight = gets.chomp.to_f
    bmi = weight / height ** 2 
    bmi = (weight / height ** 2) * 703 if system == 'i'
    puts "Your bmi is #{bmi.round(0)}."
    puts "I'm sorry to break it to you, but you're like a total fatso." if bmi >= 30
    puts "You must be a fitness buff give that bmi!" if bmi < 30
  end
end



def basic_calc
  # ask the user which operation they want to perform
  print "(a)dd, (s)ubtract, (m)ultiply, (d)ivide: "
  operation = gets.chomp.downcase
  if operation != "a" and operation != "s" and operation != "m" and operation != "d"
    puts "invalid"
  else
    puts "first number:"
    number_one = gets.chomp.to_f
    puts "second number:"
    number_two = gets.chomp.to_f
  # insert magic incatation here....
    case operation
    when "a"
      puts "#{number_one} + #{number_two} = #{number_one + number_two}"
    when "s"
      puts "#{number_one} - #{number_two} = #{number_one - number_two}"
    when "m"
      puts "#{number_one} * #{number_two} = #{number_one * number_two}"
    when "d"
      puts "#{number_one} / #{number_two} = #{number_one / number_two}"
    end
  end
end

def advanced_calc
  # ask the user which operation they want to perform
  puts "to the (p)ower, (s)quare root"
  operation = gets.chomp.downcase
  if operation != "p" and operation != "s" 
    puts "invalid"
  else

  # insert magic incatation here....
    case operation
    when "p"
      puts "first number:"
      number_one = gets.chomp.to_f
      puts "what power shall we raise it to?"
      number_two = gets.chomp.to_f
      puts "#{number_one} to the #{number_two} = #{number_one ** number_two}"
    when "s"
      puts "what number do you want to know the square root of?"
      number_one = gets.chomp.to_f
      puts "The square root of #{number_one} is #{Math.sqrt(number_one)}"
    end
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
  when 'f'
    calc_type = funky_calc
      case calc_type
      when 'm' 
        mortage
      when 'b'
        bmi
      when 't'
        trip
      else 
        'invalid'
      end
  else
    puts "invalid"
  end
    puts "Hit enter to return to the main menu"  
    gets.chomp
    response = menu
end