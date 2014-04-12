(1..10000000).each do |num|
  if num % 7 == 0 && num % 5 == 0 && num % 3 == 0
    print "Pling-Plang-Plong"
  elsif num % 7 == 0 && num % 5 == 0
    print "Plang-Plong"
  elsif num % 5 == 0 && num % 3 == 0
    print "Pling-Plang"
  elsif num % 7 == 0 && num % 3 == 0
    print "Pling-Plong"
  elsif num % 7 == 0
    print "Plong"
  elsif num % 5 == 0
    print "Plang"
  elsif num % 3 == 0
    print "Pling"
  else
    print num.to_s
  end
end

# (1..105).each do |num|
#   case num
#     when num % 7 == 0
#       print 'Plong'
#     when num % 5 == 0
#       print 'Plang'
#     when num % 3 == 0
#       print 'Pling'
#     else
#       print num.to_s
#   end
# end  