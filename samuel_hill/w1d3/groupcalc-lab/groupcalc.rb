students = %w(Ben Chris Dan Hana Jason Louie Mike Niraj Noor Paul Sam Sarah Scott)

puts `clear`
puts "*** Welcome to the Group Calculator ***"
# get user input on group size.
puts "How many people do you want in each group?"
group_size = gets.chomp.to_i
# shuffle the students and slice them up according to group size.
groups = students.shuffle.each_slice(group_size).to_a
# put groups to console and join them together.
groups.each_index { |i| puts "Group #{i+1}: #{groups[i].join(", ")}" }






