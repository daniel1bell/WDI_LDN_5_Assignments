require 'pry'
require 'pry-byebug'

#  our hashes for our lines

n_north = [:a, :e, :d, :c, :b]
n_south = [:a, :f]
six_north = [:a, :j, :i, :h, :g]
six_south = [:a, :k]
l_west = [:a, :m, :l]
l_east = [:a, :n, :o]

stations = {a: "Union Square", b: "Times Square", c: "34th Street" , d: "28th Street", e: "23rd Street", f: "8th Street", g: "Grand Central", h: "33rd Street", i: "28th Street", j: "23rd Street", k: "Astor Place", l: "8th Street", m: "6th Street", n: "3rd Street", o: "1st Street"}

lines = {a: n_north, e: n_north, d: n_north, c: n_north, b: n_north, f: n_south, j: six_north, i: six_north, h: six_north, g: six_north, k: six_south, m: l_west, l: l_west, n: l_east, o: l_east}

line_names = {n_north => "N Line (Southbound)", n_south => "N Line (Northbound)", six_north => "6 Line (Southbound)", six_south => "6 Line (Northbound)", l_west => "L Line (Eastbound)", l_east => "L Line (Westbound)"}

#  code start
puts `clear`
puts "******* Subway Mapper *******"
puts "\n\nALL LINES\tUnion Square -> (a)\n\nN LINE\t\tTimes Square -> (b) | 34th -> (c) | 28th -> (d) | 23rd -> (e) | 8th -> (f)\n\n6 LINE\t\tGrand Central -> (g) | 33rd -> (h) | 28th -> (i) | 23rd -> (j) | Astor Place -> (k)\n\nL LINE\t\t8th -> (l) | 6th -> (m) | 3rd -> (n) | 1st -> (o)"
puts puts
puts "Which stop do you want to travel FROM?"
origin = gets.chomp.downcase.to_sym
puts
puts "Which stop is your DESTINATION?"
destination = gets.chomp.downcase.to_sym
puts
puts "You will get on at #{stations.fetch(origin)} Station and travel to #{stations.fetch(destination)} Station."
puts

line_one = line_names.fetch(lines.fetch(origin))
line_two = line_names.fetch(lines.fetch(destination))

same_line_stops = lines.fetch(origin).index(origin) - lines.fetch(destination).index(destination)
# binding.pry
if line_one == line_two
  puts "#{stations.fetch(origin)} Station is #{same_line_stops.abs} stops to #{stations.fetch(origin)} Station on #{line_one}."
  puts
else
  if origin == :a
  else
    puts "#{stations.fetch(origin)} Station is #{lines.fetch(origin).index(origin)} stops to Union Square Station on #{line_one}."
    puts
  end

  if destination == :a
  else
    puts "#{stations.fetch(destination)} Station is #{lines.fetch(destination).index(destination)} stops from Union Square Station on #{line_two}."
    puts
  end
end