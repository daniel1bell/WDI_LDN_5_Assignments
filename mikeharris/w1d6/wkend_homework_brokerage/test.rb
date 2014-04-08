def rolling_ticker(input)
  require 'pry'
  print `clear`
  time_int = 20
  line-length = 30
  output_string =  input + (line_length - input.size).times {print " "}
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