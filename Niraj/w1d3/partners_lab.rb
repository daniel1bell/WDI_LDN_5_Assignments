students = %w(Ben Chris Dan Hana Jason Louie Mike Niraj Noor Paul Sam Sarah Scott)

puts "The number of students is: "
puts students.size

puts "***GROUP SIZE CALCULATOR***"
puts "How many students do you want in each group?"
group_size = gets.chomp.to_i

number_of_groups = students.size / group_size
puts number_of_groups
groups = students.shuffle.each_slice(group_size).to_a
groups.each_index { |name| puts "Group  #{name}:", groups[name] }