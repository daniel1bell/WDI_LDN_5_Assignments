require 'pry'
require_relative 'tools'

def lookup(item, array)
  puts "which #{item}?"
  array[valid_string_input]
end
