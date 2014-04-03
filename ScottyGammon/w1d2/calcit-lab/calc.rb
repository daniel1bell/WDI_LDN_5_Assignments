# Function definitions first
def menu
  # Clear the screen, and present the user with a menu
  puts `clear`
  puts "***CalcIt***"
  print "(b)asic, (a)dvanced, or (q)uit: "
  gets.chomp.downcase
end

def run_again?
  puts "whould you like to run again (y/n?)"
  gets.chomp == "y"
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

def advanced_calc
  print "(p)ower, (s)qrt: "
  operation = gets.chomp.downcase
  print "first number: "
  a = gets.to_f

  if operation == 's'
    puts "#{Math.sqrt(a)}"
  else
    print "second number: "
    b = gets.to_f
    puts "#{a**b}"
  end

  gets
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

  # if runagain?
  #   response = menu
  # else
  #   response = 'q'
  # end

  response = run_again? ? menu : 'q'

end


