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

# def number_1
#   print "First number? "
  
#   while true 
#     num1 = gets.chomp
#    break if num1.is_a? Numeric
#  end

#     puts "Please give me a number..."
#     gets.chomp
#   end
#   num1.to_f
# end

  print "First Number? "
  num1 = gets.chomp.to_f
  print "Second Number? "
  num2 = gets.chomp.to_f



case operation
when "a"
  puts  num1 + num2
when "s"
  puts num1 - num2
when "m"
  puts num1 * num2
when "d"
  puts num1 / num2
end


end

def advanced_calc
  # ask the user which operation they want to perform
  print "(p)ower, (s)quare root: "
  operation = gets.chomp.downcase

case operation

when "p"
  print "First Number? "
  num1 = gets.chomp.to_f
  print "Second Number? "
  num2 = gets.chomp.to_f
  puts  num1** num2
when "s"
  print "Number to be square rooted? "
  num1 = gets.chomp.to_f
  puts Math.sqrt(num1)
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
  end

puts "Hit enter to continue..."
gets


response = menu
end

