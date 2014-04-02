n = [:nts, :n34, :n28, :n23, :us, :n8]
l = [:l8, :l6, :us, :l3, :l1]
s = [:sgc, :s33, :s28, :s23, :us, :sap]
subway = { n: n, l: l, s: s}

def subway_error
  puts "Sorry, I didn't understand that.  Quitting."
  exit
end

# get the start and finish point from the user
print "Start line, "
subway.each_key {|line| print "#{line}, " }
puts
start_line = gets.chomp.to_sym
subway_error unless subway.include?(start_line)

print "Start point, "
subway[start_line].each {|station| print "#{station}, " }
puts
start_point = gets.chomp.to_sym
subway_error unless subway[start_line].include?(start_point)

print "End line, "; 
subway.each_key {|line| print "#{line}, " }
puts
end_line = gets.chomp.to_sym
subway_error unless subway.include?(end_line)

print "End point, "
subway[end_line].each {|station| print "#{station}, " }
puts
end_point = gets.chomp.to_sym
subway_error unless subway[end_line].include?(end_point)

# calculate the distance if they are both on the same end_line
if start_line == end_line
  length = (subway[start_line].index(start_point) - subway[start_line].index(end_point)).abs

# calculate the distance if they are on different lines
else
  #get intersection
  intersection = (subway[start_line] & subway[end_line])[0]

  #get distance from start point to intersection
  start_line_distance = (subway[start_line].index(start_point) - subway[start_line].index(intersection)).abs

  #get distance from end point to intersection
  end_line_distance = (subway[end_line].index(end_point) - subway[end_line].index(intersection)).abs

  #add distances together
  length = start_line_distance + end_line_distance
end
# output the distance to screen

puts "The length of this trip is #{length} stop(s)."
