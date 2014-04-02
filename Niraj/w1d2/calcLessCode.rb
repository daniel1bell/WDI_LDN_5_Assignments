# Function definitions first
def menu
  # Clear the screen, and present the user with a menu
  puts `clear`
  puts "***Multi-use calculator***"
  print "(b)asic, (a)dvanced, or (q)uit: "
  gets.chomp.downcase
end

def basic_calc
  # ask the user which operation they want to perform
  print "(a)dd, (s)ubtract, (m)ultiply, (d)ivide: "
  operation = gets.chomp.downcase

  if operation == "a" || operation=="s" || operation=="m" || operation=="d"

    print "Enter first number: "
    first_number = input_number
    print "Enter second number: "
    second_number = input_number

    puts "The answer is"
  end

---------------------------------------------------

  case operation
  when 'a'
    puts first_number + second_number
  when 's'
    puts first_number - second_number
  when 'm'
    puts first_number * second_number
  when 'd'  
    puts first_number / second_number
  else
    "This should'nt be too hard - try again!"
  end

  puts "Press any key to return"
  end


----------------------------------------------------

def advanced_calc
  print "(p)ower, (s)quare root, (T)rip"
  operation = gets.chomp.downcase

if operation == "p"
  print "Enter first number:"
  first_number = input_number

  print "Enter second number"
  second_number = input_number

  puts "The answer is:"
end

if operation == "s"
  operation.gets.chomp.downcase
  print "Enter the number you would like the square root of"
  first_number = input_number

  puts "The answer is:"
end

# if operation == "t"
#   print "How far do you travel in miles?"
#   distance = gets.to_i
#   print "How many Miles Per Gallon (MPG) does you car do?"
#   mpg - gets.to_i
#   print "What will your average speed be in Miles (MPH)?"
#   mph = gets.to_i
#   puts "Your trip will take around #{distance/mph} hours and will cost around #{distance/mph * gas}."

#   puts "Press any key to return"
# end


----------------------------------------------------

case operation
when 'p'
  puts first_number ** second_number
when 's'
  puts Math.sqrt(first_number)
else
  puts "How hard can it be? Try again."
end
  

# puts "Press any key to return"
# gets
# end

def input_number
  gets.chomp.to_f
end

response = menu # Return value of menu

    while response != 'q'
  case response
  when 'b'
    basic_calc
  when 'a'
    advanced_calc
  end
# gets
#   response = menu
#     end