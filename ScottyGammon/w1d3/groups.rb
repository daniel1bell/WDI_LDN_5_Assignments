students = %w(Ben Chris Dan Hana Jason Louie Mike Niraj Noor Paul Sam Sarah Scott)
students.each do |name|
    print "#{name} "
end
puts
# ask user number of groups
puts "What size group do you want? "
# save it as a variable
group_size = gets.chomp.to_i
# shuffle the student list
random_students = students.shuffle
# break students into groups
groups = random_students.each_slice(group_size).map { |a| a}
# if length of last group is less than group size
if  groups.last.size < group_size
  # take remainder and distribute amoungst the group
  groups[-2].push(groups.pop)
end
# write groups to screen
#puts groups.inspect
groups.size.times do |n|
	puts "Group #{n+1}: #{groups[n].join(" ")}"
end