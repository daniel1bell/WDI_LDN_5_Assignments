require 'pry'

students = %w(Ben Chris Dan Hana Jason Louie Mike Niraj Noor Paul Sam Sarah Scott)

def sort (students)

    students.shuffle!

    print "What group size would you like? "
    user_input = gets.chomp
    number = user_input.to_i

    if number <= 0
    
      puts "That's rubbish - you can't just write something like #{user_input} - that's just silly."
      sleep(2)
      puts "idiot"
      sleep(1)
    
    else

      how_many_groups = students.size / number 
     
      group = []

      how_many_groups.times do |j|
        group[j] = []
        number.times do |i| 
         group[j][i] = students.pop
        end
      end 

      #binding.pry
      if students.size <= (number.to_f / 2) 
        students.each { |student| group.last << student}
      else 
        group << students
      end

      i = 1
      group.each do |smallgroup| 
        print "Group", i , ": " , smallgroup.sort  , "\n" 
        i +=1
      end

    end

end
 


sort(students)

