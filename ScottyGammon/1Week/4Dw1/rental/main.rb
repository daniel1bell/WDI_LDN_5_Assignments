require 'pry'

#loaded some files
require_relative 'person'
require_relative 'building'
require_relative 'flat'
require_relative 'menu'

#set up initial data
b = Building.new ('w1n 4hr')
b.post_code = "w1n 4hr"
b.affluency = :minted

f1 = Flat.new('Reeves', 750, 4, 2)

f2 = Flat.new('9 Back Hill', 5000, 12, 4)

f3 = Flat.new('The Bowler', 1000, 5, 2)

[f1,f2,f3].each do |flat|
	b.flats[flat.name] = flat
end

p1 = Person.new('louie','911')
p2 = Person.new('mike','999')
p3 = Person.new('sarah','111')
p4 = Person.new('julien','333')

f1.tenants[p1.name] = p1
f1.tenants[p2.name] = p2
f2.tenants[p3.name] = p3

b.prospects[p4.name] = p4

#run command line interaction
response = menu.downcase
while response != "q"

	case response
	when 1.to_s
		puts b.list_flats 
	when 2.to_s
		puts b.list_prospects
	when 3.to_s
		let_flat(b)
	when 4.to_s
		evict_tenant(b) #todo- write this method
	when 5.to_s
		puts b.list_empty_flats
	when 6.to_s
		puts b.list_tenants
	when 7.to_s
		b.create_prospect
	when 8.to_s
		b.create_flat
	end

gets
	response = menu
end