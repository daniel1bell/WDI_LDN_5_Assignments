require 'pry'
require 'pg'
 
@db = PG.connect(:dbname =>'facebook', :host => 'localhost')
begin


def menu
  puts `clear`
  puts "*** FaceGAbook ***\n\n"
  @db.exec( "select * from people" ) do |result|
    puts "These people are currently in the DB:"
    result.each do |row|
      puts "#{row['first']} #{row['last']} (id: #{row['id']})"
    end
  end
  puts
  puts '1 : Create person'
  puts '2 : Show person'
  puts '3 : Edit person'
  puts '4 : Delete person'
  puts "Q : Quit\n\n"
  print '--> '
  gets.chomp
end

def create_person
  print "first name: "
  first_name = gets.chomp
  print "last name: "
  last_name = gets.chomp
  print "dob: "
  dob = gets.chomp

  sql = "insert into people (first, last, dob) values ('#{first_name}', '#{last_name}', '#{dob}')"
 
  @db.exec sql
end

def show_person
  id = get_id

  sql = "select * from people where id = #{id}"
 
  if person = @db.exec(sql).first
    puts "name: #{ [person['first'], person['last']].compact.join(' ')}"
    puts "dob (age): #{person['dob']} #{age_for(person['dob'])}"
  else
    puts "ID not found"
  end
end

def delete_person
  id = get_id
  sql = "delete from people where id = #{id}"
 
  @db.exec(sql)
end

def edit_person
  id = get_id

  sql = "select * from people where id = #{id}"

  if person = @db.exec(sql).first
    print "first name: (#{ person['first']}) "
    first_name = gets.chomp
    print "last name: (#{ person['last']}) "
    last_name = gets.chomp
    print "dob: (#{ person['dob']}) "
    dob = gets.chomp

    sql = "update people set first = '#{first_name}', last = '#{last_name}', dob = '#{dob}' where id = #{id}"

    @db.exec(sql)
  else
    puts "ID not found"
  end

end


def get_id
  print "what is their ID: "
  gets.to_i
end

def age_for(dob=nil)
  return unless (dob = Date.parse(dob.to_s) rescue nil)
  now = Date.today
  age = now.year - dob.year
  age -= 1 if now.month < dob.month || (now.month == dob.month && now.mday < dob.mday)
  age
end

response = menu
while response != 'q'
  case response
  when '1' then create_person
  when '2' then show_person
  when '3' then edit_person
  when '4' then delete_person
  end
  puts "press enter to continue"
  gets
  response = menu
end



ensure
  @db.close
end














