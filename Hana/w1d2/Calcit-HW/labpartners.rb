require 'pry'



students = %w(Ben Chris Dan Hana Jason Louie Mike Niraj Noor Paul Sam Sarah Scott)



def sort (students)
print "What group size would you like?"
number = gets.chomp.to_i
number_of_groups = students.size / number
student_remainders = students.size % number

students.shuffle!

group = []
number_of_groups.times do |j|
  group[j] = []
  number.times do |i|
    group[j][i] = students.pop
    end

if students.size <= (number / 2)
  students.each {|remainder|group.last << remainder}
else
  group << students
end

end
group_number = 0
#Print out groups in lists.
number_of_groups.times do |h|
  group_number = h + 1
  puts "Group #{group_number}: #{group[h]}"
end

unless students.size <= (number / 2)
  puts "Group #{group_number + 1}: #{students}"
end

end

sort(students)

def menu
  print "Press any key to return to the menu."
  gets
  sort(students)
 
end

menu

