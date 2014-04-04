students = %w(Ben Chris Dan Hana Jason Louie Mike Niraj Noor Paul Sam Sarah Scott)
students = students.shuffle
number_of_students = students.size

puts "***Lab Partners Grouper***"
puts
puts "Group size?"
group_size = gets.chomp.to_i

puts

number_of_groups = number_of_students / group_size
remaining_students = number_of_students % group_size

number_of_groups.times { |i|
  puts "Group \##{i+1}:"
  group_size.times {
    puts students.pop
  }
  if students.size == remaining_students
    puts students
  end
  puts
}
