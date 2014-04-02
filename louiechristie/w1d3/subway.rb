length = 0
start_line = ""
start_point = ""
end_line = ""
end_point = ""

n = [:nts, :n34, :n28, :n23, :us, :n8]
l = [:l8, :l6, :us, :l3, :l1]
s = [:sgc, :s33, :s28, :s23, :us, :sap]
subway = { n: n, l: l, s: s}

def get_distance(start_ln, start_pt, finish_ln, finish_pt)
  (subway[start_ln].index(start_pt) - subway[start_ln].index(end_pt)).abs
end

# get the start and finish point from the user
print "Start line, "
subway.each_key {|key| print "#{key}, " }
puts
start_line = gets.chomp.to_sym
print "Start point, "
subway[start_line].each {|station| print "#{station}, " }
puts
start_point = gets.chomp.to_sym

print "End line, "
subway.each_key {|key| print "#{key}, " }
puts
end_line = gets.chomp.to_sym
print "End point, "
subway[end_line].each {|station| print "#{station}, " }
puts
end_point = gets.chomp.to_sym


# calculate the distance if they are both on the same end_line
if start_line == end_line
#  subway[start_line][start_point].index > subway[start_line][end_point] ? puts 
length = (subway[start_line].index(start_point) - subway[start_line].index(end_point)).abs

# calculate the distance if they are on different lines
else

  #get intersection
  intersection = :us

  #get distance from start point to intersection
  start_line_distance = (subway[start_line].index(start_point) - subway[start_line].index(intersection)).abs

  #get distance from end point to intersection
  end_line_distance = (subway[end_line].index(end_point) - subway[end_line].index(intersection)).abs

  #add distances together
  length = start_line_distance + end_line_distance
end
# output the distance to screen

puts "The length of this trip is #{length} stop."