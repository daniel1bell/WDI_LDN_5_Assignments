

students = %w(Ben Chris Dan Hana Jason Louie Mike Niraj Noor Paul Sam Sarah Scott)

puts "The number of students is: "
puts students.size

puts "***Get student group size***"
puts "What kind of group size do you want?"
group_size = gets.chomp.to_i

groups = students.shuffle.each_slice(group_size).to_a

groups.each_index { |name| puts "Group #{name+1}:", groups[name] }

