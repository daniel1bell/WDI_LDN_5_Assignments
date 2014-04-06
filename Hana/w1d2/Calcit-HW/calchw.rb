

# Function definitions first
def menu
  # Clear the screen, and present the user with a menu
  puts `clear`
  puts "***CalcIt***"
  print "(b)asic, (a)dvanced, (m)onthly mortgage, bm(i), (t)rip or (q)uit: "
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
  print "Amount of the loan: " 
  p = gets.chomp.to_f
    until p >= 0 do
      puts "Please insert a positive number."
      p = gets.chomp.to_f
    end
  print "Interest Rate (%): "
  i = gets.chomp.to_f * 0.01 / 12
  print "Number of payments to make: "
  n = gets.chomp.to_f

  result = p * (( i * ( (1+i)**n) )/ ( ( (1+i)**n) - 1 ) )

  result = sprintf "%.2f", result.to_s
  puts "Your monthly mortgage is $#{result}."
end

def bmi
 print "(e)mpirial or (m)etric "
 system = gets.chomp.downcase
case system
when "e"
  print "Mass (lb):"
  mass = gets.chomp.to_f
    until mass >= 0 do
        puts "Please insert a positive number."
        mass = gets.chomp.to_f
      end

  print "Height (in):"
  height = gets.chomp.to_f
    until height >= 0 do
      puts "Please insert a positive number."
      height = gets.chomp.to_f
    end
  result = ((mass)/(height)**2)*703
when "m"
  print "Mass (kg):"
  mass = gets.chomp.to_f
    until mass >= 0 do
        puts "Please insert a positive number."
        mass = gets.chomp.to_f
    end
  print "Height (m):"
  height = gets.chomp.to_f
    until height >= 0 do
      puts "Please insert a positive number."
      height = gets.chomp.to_f
    end
  result = (mass) / (height) ** 2
else
  result = "Invalid"
end

result = sprintf "%.1f", result.to_s
puts "Your BMI is #{result}."
end

def trip
 print "Distance driven: "
 distance = gets.chomp.to_f
  until distance >= 0 do
      puts "Please insert a positive number."
      distance = gets.chomp.to_f
  end
 print "Fuel efficiency (mi/gal):"
 efficiency = gets.chomp.to_f
 print "Gas cost per gallon ($/gal):"
 price = gets.chomp.to_f
 print "Speed (mi/hr):"
 speed = gets.chomp.to_f
 


 time = sprintf "%.2f", distance / speed
 cost = sprintf "%.2f", distance * price / efficiency

 puts "Your trip will take #{time} hours and $#{cost}."
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
  when 'i'
    bmi
  when 't'
    trip
  end
  puts "Press any key to return to the menu."
  gets
  response = menu
end

