# Function definitions first
def menu
  # Clear the screen, and present the user with a menu
  puts `clear`
  puts "***CalcIt***"
  print "(b)asic, (a)dvanced, (m)ortgage, (b)mi, (t)rip or (q)uit: "
  gets.chomp.downcase
end


def basic_calc
  # ask the user which operation they want to perform
  print "(a)dd, (s)ubtract, (m)ultiply, (d)ivide: "
  b_operation = gets.chomp.downcase

#our code
#BASIC CALCULATIONS
#Asking for numbers
if (b_operation == 'a'||b_operation =='s'||b_operation =='m'||b_operation =='d')
puts "First number: "
b_number_one = gets.chomp.to_f
puts "Second number: "
b_number_two = gets.chomp.to_f
else
  result = "Invalid"
end

case b_operation
  when 'a'
    result = b_number_one + b_number_two
  when 's'
    result = b_number_one - b_number_two
  when 'm'
    result = b_number_one * b_number_two
  when 'd'
    result = b_number_one / b_number_two
  end
puts result.to_s
end

#ADVANCED CALCULATIONS
def advanced_calc
  # ask the user which operation they want to perform
  print "(p)ower, (s)quare root: "
  a_operation = gets.chomp.downcase

case a_operation
  when 'p'
    puts "First number: "
    a_number_one = gets.chomp.to_f
    puts "Second number: "
    a_number_two = gets.chomp.to_f
    result = a_number_one ** a_number_two

  when 's'
    puts "Number to be squared-rooted: "
    a_number_one = gets.chomp.to_f
    result = Math.sqrt(a_number_one)
  else
    result = "Invalid"
  end
  puts result.to_s
end

#MORTGAGE CALCULATIONS
def mortgage
  # ask the user for info
  print "Principal Amount: " 
  principal_amount = gets.chomp.to_f
  print "Interest Rate: "
  interest_rate = gets.chomp.to_f
  print "Number of Payments: "
  number_of_payments = gets.chomp.to_f

  result = principal_amount*((interest_rate(1+interest_rate)^number_of_payments)/(((1+interest_rate)^n)-1))

  puts result.to_s
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
    mortgage
  when 'b'
    bmi
  when 't'
    trip
  end
  puts "Press any key to return to the menu."
  gets
  response = menu
end

