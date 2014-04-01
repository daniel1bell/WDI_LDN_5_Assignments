
def menu
  
  puts `clear`
  puts "***CalcIt***"
  print "(b)asic, (a)dvanced, or (q)uit: "
  gets.chomp.downcase
end
 
def basic_calc
    print "(a)dd, (s)ubtract, (m)ultiply, (d)ivide: "
  operation = gets.chomp.downcase
 
 if operation == "a" || operation == "s" || operation == "m" || operation == "d"
  print "Enter first number: "
  firstnumber = input_number
  print "Enter second number: "
  secondnumber = input_number
end

puts "The answer is:" 
 
 case operation
  when 'a'
  puts firstnumber + secondnumber
  when 's'
  puts firstnumber - secondnumber
  when 'm'
  puts firstnumber * secondnumber
  when 'd'
  puts firstnumber / secondnumber
else
  puts "You're an idiot, try again!"
  end

puts "Hit any key to continue"
gets

end
 
def advanced_calc
  print "(p)ower, (s)quare root: "

  operation = gets.chomp.downcase
 
  if operation == "p" || operation == "s"
    print "Enter first number: "
    firstnumber = input_number
    if operation == "p"
      print "Enter second number: "
      secondnumber = input_number
    end
  end
puts "The answer is:" 

case operation
  when 'p'
  puts firstnumber ** secondnumber
  when 's'
  puts Math.sqrt(firstnumber)
else
  puts "You're joking... try again!"
  end
 

puts "Hit any key to continue"
gets

end

 def input_number
  gets.chomp.to_i
 end

 
response = menu
 
while response != 'q'
  case response
  when 'b'
    basic_calc
  when 'a'
    advanced_calc
  end
 
 response = menu

end