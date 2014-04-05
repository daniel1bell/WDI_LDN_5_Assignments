def menu
  puts `clear`
  puts "*** Mike's Brokerage House ***"
  puts "\n\n"
  puts "By default this pulls in stock data from the web."
  puts "If you don't have an internet connection you can use sample data."
  puts "Update your preferrence in settings"
  puts "\n\n"

  puts "1 : List Stocks on the Brokerage"
  puts "2 : List Brokerage Clients"
  puts "* : *****"
  puts "s : Settings"
  puts "q : Quit"

  print '---> '
  gets.chomp

end


def settings(data_setting)
#sets whether using internet data or not.

  if data_setting 
    puts "Currently using data from the internet"
  else
    puts "Currently using local data"
  end

  puts "Would you like to change the settings?"
  puts "(y)es/(n)o"
  change = gets.chomp.downcase

  if change =="y"
    puts "Changing the setting"
    data_setting = data_setting ? false : true
  else
    puts "Not changing"
  end
  
  puts data_setting ? "Using internet data" : "Using local data"

  data_setting

end

