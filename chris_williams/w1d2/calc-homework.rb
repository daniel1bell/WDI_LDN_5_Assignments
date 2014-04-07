require 'pry'

def menu
  puts `clear`
  puts "***CalcIt***"
  print "(b)asic, (a)dvanced, (m)ortgage calc, (bm)i calc, (t)rip_calc or (q)uit: "
  gets.chomp.downcase
end


def basic_calc
  print "(a)dd, (s)ubtract, (m)ultiply, (d)ivide: "
  operation = gets.chomp.downcase
  print "first number: "
  a = gets.to_f
  print "second number: "
  b = gets.to_f

  case operation
  when 'a'
    puts "#{a + b}"
  when 's'
    puts "#{a - b}"
  when 'm'
    puts "#{a * b}"
  when 'd'
    puts "#{a / b}"
  end

  gets
end

def advanced_calc
  print "(p)ower, (s)qrt, (m)ortgage, (b)mi, (t)rip: "
  operation = gets.chomp.downcase
  print "first number: "
  a = gets.to_f

  if operation == 's'
    puts "#{Math.sqrt(a)}"
  else
    print "second number: "
    b = gets.to_f
    puts "#{a**b}"
  end

  gets
end

def mortgage_calc
  print "annual interest rate: "
  i = gets.to_f
  print "number of payments: "
  n = gets.to_f
  print "principal of loan: "
  p = gets.to_f
  mo_i = i / 12
  f_1 = (1 + mo_i) ** n
  f_2 = mo_i * f_1
  f_3 = f_1 - 1
  f_4 = f_2 / f_3
  f_5 = p * f_4
  puts "Your monthly payment is $#{f_5}"
  print "Press any key to continue: "
  gets
end

def bmi_calc
  print "(i)mperial or (m)etric: "
  operation = gets.chomp.downcase
  if operation == 'i'
    print "weight(lbs): "
    w_lbs = gets.to_f
    print "height(in): "
    h_in = gets.to_f
    f_1 = h_in ** 2
    f_2 = w_lbs / f_1
    f_3 = f_2 * 703.06957964
    puts "Your BMI is #{f_3}"
  else
    print "weight(kg): "
    w_kg = gets.to_f
    print "height(m): "
    h_m = gets.to_f
    f_4 = h_m ** 2
    f_5 = w_kg / f_4
    puts "Your BMI is #{f_5}"
  end
  print "Press any key to continue: "
  gets
end

def trip_calc
  print "How many miles will you drive? "
  mi = gets.to_f
  print "How many miles per gallon does the car get? "
  mpg = gets.to_f
  print "How much does gas cost per gallon?($) "
  cpg = gets.to_f
  print "How fast will you drive?(mph) "
  speed = gets.to_f
  binding.pry
  time = mi / speed
  cost = (mi / mpg) * cpg
  puts "Your trip will take #{time}hour(s) and cost $#{cost}"
  print "Press any key to continue: "
  gets
end

response = menu

while response != 'q'
  case response
  when 'b'
    basic_calc
  when 'a'
    advanced_calc
  when 'm'
    mortgage_calc
  when 'bm'
    bmi_calc
  when 't'
    trip_calc
  end

  response = menu
end
