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
  print "Please wait while we update prices."

end

def import_ticker_file(nos_tickers=30, file_name="NASDAQ.txt")
    f = File.open(file_name)
    all_the_lines = f.readlines
    g = []
    
    #split the lines by the tab
    all_the_lines.each do |line|
      g << line.split("\t")
    end
    
    tickers = []
    #turn into a single array
    (1...g.length).each do |i|
      if i < nos_tickers
        tickers << g[i][0].strip 
      end
    end
    
    tickers
end

def export_tickers(tickers, file_name="TICKERS.txt")
    f = File.open(file_name, "w")
    f.write(tickers)
end

def export_stock_data(to_save, file_name="TEST.txt")
    f = File.open(file_name, "w")
    f.write(to_save)
end