def menu
  puts `clear`
  puts "*** Mike's Brokerage House ***"
  puts "\n\n"
  print "Curently "
  print !$data_setting ? "not " : ""
  puts "using internet data"  
  puts "To change goto settings"

  puts "\n\n"

  puts "1 : List Stocks on the Brokerage"
  puts "2 : Update stock prices"
  puts "3 : List Clients"
  puts "4 : Add a CLient"
  puts "5 : See a Clients Portfolio"
  puts "6 : Log on as a Client to trade"
  puts "s : Settings"
  puts "q : Quit"

  print '---> '
  gets.chomp

end


def settings
#sets whether using internet data or not.

  if $data_setting 
    puts "Currently using data from the internet"
  else
    puts "Currently using local data"
  end

  puts "Would you like to change the settings?"
  puts "(y)es/(n)o"
  change = gets.chomp.downcase

  if change =="y"
    puts "Changing the setting"
    $data_setting = $data_setting ? false : true
  else
    puts "Not changing"
  end
  
  puts $data_setting ? "Using internet data" : "Using local data"


end


def spacer(value, col_width)
  value = value.to_s
  space = ""
  (col_width - value.size).times { space << " "}
  value += space 
end


def buy_stock

end

def create_client(b)
  puts "What's the clients name?"
  client_name = gets.chomp.to_s
  puts "How much money does the client have?"
  client_money = gets.chomp.to_i
   
  new_client = Client.new(client_name, client_money)
  
  b.add_client(new_client)

  puts "Client added. Here are all the current clients."
  puts "Log in to see portfolios and money"

  b.list_clients
end






