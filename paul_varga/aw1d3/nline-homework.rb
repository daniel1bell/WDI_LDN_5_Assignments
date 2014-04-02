Lines = {"n" => 
          ["ts", "34th", "28th", "n23rd", "us", "8th"],
         "l" =>
          ["8th", "6th", "us", "3rd", "1st"],
         "s" =>
          ["gc", "33rd", "28th", "s23rd", "us", "ap"] 
          }

intersection =  { Lines['n'] & lines['l'] & lines['s'] }

puts intersection 