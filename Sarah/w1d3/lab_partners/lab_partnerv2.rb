def is_a_number(s)
  s.to_s.match(/\A[+-]?\d+?(\.\d+)?\Z/) == nil ? false : true
end


students = %w(Ben Chris Dan Hana Jason Louie Mike Niraj Noor Paul Sam Sarah Scott)

puts "Let's divide the class into groups."
puts "How large of a group do you want?"
input = gets.chomp

while is_a_number(input) == false
  puts "please enter a NUMBER!"
  input = gets.chomp
end

group_size = input.to_i

if students.size % group_size == 0
  number_of_groups = students.size / group_size 
# elsif
#   students.size % group_size == 1
#   puts "Warning. There will be one leftover person in a group of one!"
#   puts "This person will be added to an existing group"
#   number_of_groups = students.size / group_size 
else
  number_of_groups = students.size / group_size + 1
end

random_students = students.shuffle
groups = random_students.each_slice(group_size).to_a
#  if students.size % group_size == 1
#   leftover = groups.pop
  
# else
groups.each { |group| puts "Group #{groups.index(group)}: #{group.join(" ")}"}
# end