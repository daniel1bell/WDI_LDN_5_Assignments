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
      s.to_s.match(/\A[+-]?\d+?(\.\d+)?\Z/) == nil ? false : true 
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
  puts "Please provide a valid response."
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
  
  puts "\n Welcome to the mortgage calculator! \n
  We'll need you to have the following information available: the Principal Amount; the Interest Rate and the Number of Payments you want to set the mortgage over. \n
  We'll give you back the monthly payment you'll need to make. \n \n"
  
  puts "What is your 'Principal Amount'?  "
  p_amount = get_number

when "s"
  print "Number to be square rooted? "
  num1 = get_number
  puts Math.sqrt(num1)
else
  puts "Please provide a valid response."
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
    puts "Please provide a valid response."
  end

puts "Hit enter to continue..."
gets


response = menu
end

