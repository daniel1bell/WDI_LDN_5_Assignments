# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Car.create(make: 'Mini', model: 'One', reg_year: 2006, price: 6000.00, mileage: 77000, colour: '#000', gearbox: 'Manual', fuel: 'Petrol', fuel_economy: 36, image: 'http://www.tidycars.co.uk/car/853-0.jpg', number_doors: 3, number_seats: 4, notes: 'It handles like a go-cart and is as much of a goer as Edwina Curry. A couple of years ago we lost a green apple jelly bean down the front left air conditioning vent. Depending on the climate you can get either a waft of citrus freshness or the pungent petrification of artificial flavouring. It''s like playing regular games of odour roulette at absolutely no extra cost.')

Car.create(make: 'Mercedes', model: 'S-Class', reg_year: 2014, price: 62905, mileage: 0, colour: 'gray', gearbox: 'Automatic', fuel: 'Diesel', fuel_economy: 52, image: 'http://www.thegreencarwebsite.co.uk/cms-images/Mercedes-Benz-S-Class-Hybrid.jpg', number_doors: '4', number_seats: '5', notes: 'Aluminium has been used extensively in the construction of the new S-Class, making it both lighter and more rigid than its predecessor. Coupled with the aerodynamic new styling, this offers significant advantages in terms of handling and efficiency.

A choice of three engines includes the S 350 BlueTEC, a V6 diesel that returns up to 51.4 mpg* combined and is capable of 0–62 mph in 6.8 seconds.

If petrol is your preference, the V6 petrol hybrid – the S 400 Hybrid L – also takes just 6.8 seconds to go from 0–62 mph, yet achieves up to 44.8 mpg* combined. 

Alternatively, there’s the S 500 L, a formidable petrol V8 that can generate 700 Nm of torque and reach 62 mph from a standing start in only 4.8 seconds. It’s a luxury saloon with the heart of a thoroughbred.')

Car.create(make: 'VW', model: 'T2 Campervan', reg_year: 1972, price: 12000, mileage: 59000, colour: 'darkgreen', gearbox: 'Manual', fuel: 'Petrol', fuel_economy: 13, image: 'http://modculture.typepad.com/.a/6a00d83451cbb069e2015390df272a970b-800wi', number_doors: '4', number_seats: '6', notes: 'FOR SALE RARE CLASSIC TYPE 2 CAMPER VAN 1972 AND ALL IN ORIGINAL CONDITION , ROCK AND ROLL BED , SINK AND STORAGE ( SO72/7 CAMPING CONVERSION ) , ALSO INCLUDING AWNING , STORED INSIDE ,SAME OWNER LAST 7 YEARS IN EXCELLENT CONDITION COVERING A MERE 4000KM FEATURED IN THE VOLKSWAGEN CAMPER & COMMERCIAL MAGAZINE (2007 ISSUE 29 ) £12,000')