def rolling_ticker
  require 'pry'
  print `clear`
  time_int = 20
  output_string = "Hello                   "
  print output_string
  (1..100).each do |i|
    sleep(1.0/time_int)
    (0..output_string.length).each do |i|
      print "\b"
    end
    
    new_output = ""
    new_output[0] = output_string[output_string.length-1]

    (0...(output_string.length-1)).each do |i|
      new_output[i+1] = output_string[i]
    end
    
    output_string = new_output
    print output_string
  end
    
  
end

rolling_ticker