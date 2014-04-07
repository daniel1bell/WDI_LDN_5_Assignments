def valid_string_input(array)
  input = gets.chomp.to_sym
  unless array.index(input)
    puts "Not a valid entry."
    puts "Please enter one of: '#{array.join("', '")}'"
    input = gets.chomp.to_sym
  end
  input
end

def is_a_number(s)
  s.to_s.match(/\A[+-]?\d+?(\.\d+)?\Z/) == nil ? false : true
end

def valid_number_input
  input = gets.chomp
  while is_a_number(input) == false
    puts "Not a valid entry."
    puts "The input must be a number."
    input = gets.chomp
  end
  input
end