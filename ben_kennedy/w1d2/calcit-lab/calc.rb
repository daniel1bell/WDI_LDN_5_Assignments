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
  else
    puts "invalid"
  end
end

def advanced_calc
  # ask the user which operation they want to perform
  puts "to the (p)ower, (s)quare root"
  operation = gets.chomp.downcase
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
 
 
# run the app...


response = menu
 
while response != 'q'
  case response
  when 'b'
    basic_calc
  when 'a'
    advanced_calc
  else
    puts "invalid"
  end
    puts "Hit enter to return to the main menu"
    gets.chomp
    response = menu
end