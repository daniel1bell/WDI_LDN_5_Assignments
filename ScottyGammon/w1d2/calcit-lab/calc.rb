# Function definitions first
def menu
  # Clear the screen, and present the user with a menu
  puts `clear`
  puts "***CalcIt***"
  print "(b)asic, (a)dvanced, or (q)uit: "
  gets.chomp.downcase
end

def runagain
  puts "whould you like to run again (y/n?)"
  answer=gets.chomp
  if answer=='y'
    menu
  else quit
  end
end
# def number_1
#  # ask for the first number
#  print "First Number? "
#  num1 = gets.chomp.to_f
# end

#  def number_2
#    # ask for the second number
#    print "Second Number? "
#    num2 = gets.chomp.to_f
# end

def basic_calc
  # ask the user which operation they want to perform
  print "(a)dd, (s)ubtract, (m)ultiply, (d)ivide: "
  operation = gets.chomp.downcase

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


# run the app...
response = runagain
response = runagain
while response != 'q'
  case response
  when 'b'
    basic_calc
  when 'a'
    advanced_calc
  end
end