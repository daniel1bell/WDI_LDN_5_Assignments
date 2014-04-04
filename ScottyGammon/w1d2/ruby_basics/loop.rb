def warn_user
	print "no, try again."
end
def get_info
	gets.to_i
end
def greet(name)
	puts "hello #{name}"
end
puts "what is your name?"
greet (gets.chomp)
puts "what is 2 to the 4th power?"
value = get_info
while value != 2**4
	warn_user
	value = get_info
end
puts "congrats, you got it"

