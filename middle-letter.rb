require 'pry'
require 'rainbow'
require 'rainbow/ext/string'
require 'highline/import'

$columns = HighLine::SystemExtensions.terminal_size[0].to_i
$lines = HighLine::SystemExtensions.terminal_size[1].to_i
$message_length = 60

def middle_letter(input)
  len = input.length

  if len % 2 == 0
    char1 = input[(len / 2 - 1).to_i]
    char2 = input[(len / 2).to_i]

    puts "Your string was of an even number of characters."
    puts ("These are the middle two characters: #{char1}, #{char2}")
  else
    char1 = input[(len / 2).to_i]
    puts "Your string was of an odd number of characters."
    puts ("This is the middle character: #{char1}")
  end

  puts ""
  puts Rainbow("------------------------------------------------------------").bg(:blue)
  puts Rainbow('          Enter another string, or type q to exit           ').black.bg(:green)
  puts Rainbow("------------------------------------------------------------").bg(:blue)
  puts ""
end

def welcome_message
  puts Rainbow("------------------------------------------------------------").bg(:blue)
  puts Rainbow("                                                            ").bg(:blue)
  puts Rainbow("    Enter a string, and I'll return the middle letter(s)    ").bg(:blue)
  puts Rainbow('          ( You can enter "q" to exit at any time )         ').bg(:blue)
  puts Rainbow("                                                            ").bg(:blue)
  puts Rainbow("------------------------------------------------------------").bg(:blue)
  puts Rainbow("").bg(:blue)
end


welcome_message()

while true do
  input = gets.strip
  puts ""
  if input.downcase == 'q'
    puts "Goodbye!"
    break
  end
  middle_letter(input)
end
