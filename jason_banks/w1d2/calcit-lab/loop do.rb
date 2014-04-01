def loop_loop
  loop do
    puts "Number?"
    num1 = gets.chomp
    num1_integer = num1.to_i
    num1_integer_string = num1_float.to_s
    break if num1_float_string == num1
    puts "Please provide a number."
  end
    
end

loop_loop