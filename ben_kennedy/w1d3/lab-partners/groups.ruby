def is_a_number(s)
  s.to_s.match(/\A[+-]?\d+?(\.\d+)?\Z/) == nil ? false : true
end


students = %w(Ben Chris Dan Hana Jason Louie Mike Niraj Noor Paul Sam Sarah Scott)

puts "Let's divide the class into groups."
puts "How large of a group do you want?"
input = gets.chomp

while is_a_number(input) == false
  puts "Don't mess with me jerk!  #{input}} is not a number! Enter a NUMBER!"
  input = gets.chomp
end

group_size = input.to_i

if students.size % group_size == 0
  number_of_groups = students.size / group_size 
elsif
  students.size % group_size == 1
  puts "Warning. There will be one leftover person in a group of one!"
  puts "This person will be added to an existing group"
  number_of_groups = students.size / group_size 
else
  number_of_groups = students.size / group_size + 1
end

groups = [ ]

for n in 0...number_of_groups - 1
  groups[n] = [ ] 
  i = 1
  while i <= group_size
    student = students.sample
    groups[n] << student
    students = students.reject { |name| name == student }
    i = i + 1
  end

puts "Group #{n+1}: #{groups[n].join(" ")}"

end

puts "Group #{number_of_groups}: #{students.join(" ")}"

