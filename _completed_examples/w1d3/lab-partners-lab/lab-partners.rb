require 'pry-byebug'

students = %w(Ben Chris Dan Hana Jason Louie Mike Niraj Noor Paul Sam Scott)

students = students.shuffle

puts `clear`
puts "***Lab Partners***"
print "Group size? "

group_size = gets.to_i
number_of_groups = students.count / group_size

puts `clear`
number_of_groups.times do |group_number|
  puts  "\n\nGroup #{group_number} : "
  print "#{students.pop(group_size).join(', ')}"
end
puts ", #{students.join(', ')}" if students.any?


puts "\n\n"
