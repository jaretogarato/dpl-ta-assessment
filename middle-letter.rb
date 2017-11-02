require 'pry'
require 'rainbow'
require 'rainbow/ext/string'
require 'highline/import'

$columns = HighLine::SystemExtensions.terminal_size[0].to_i
$lines = HighLine::SystemExtensions.terminal_size[1].to_i
$message_length = 60

class Numeric
  def degrees
    self * Math::PI / 180
  end
end

fill_screen = Proc.new do |columns, lines, r, g, b|
  for i in (1..lines)
    for j in (1..columns)
      print Rainbow(" ").bg(r, g, b)
    end
    puts "\n"
  end
end

def color_shift(someProc)
  for i in (0..24)
    red = (((Math::sin((i * 10).degrees) + 1) / 2) * 255).to_i
    green = (((Math::sin((i * 10 - 60).degrees) + 1) / 2) * 255).to_i
    blue = (((Math::sin((i * 10 - 120).degrees) + 1) / 2) * 255).to_i
    # puts "#{i}  #{red}"
    someProc.call($columns, $lines, red, green, blue)
  end
end

def middle_letter(input)
  len = input.length

  # puts "columns: #{$columns}"
  # puts "lines: #{$lines}"

  if len % 2 == 0
    char1 = input[(len / 2 - 1).to_i]
    char2 = input[(len / 2).to_i]
    puts "You input the string: #{input}"
    puts "Your string was of an even number of characters."
    puts ("These are the middle two characters: #{char1}, #{char2}")
  else
    char1 = input[(len / 2).to_i]
    puts "Your string was of an odd number of characters."
    puts ("This is the middle character: #{char1}")
  end

  puts ""
  puts Rainbow("------------------------------------------------------------").bg(:blue)
  puts Rainbow("                                                            ").bg(:blue)
  puts Rainbow('          Enter another string, or type q to exit           ').black.bg(:green)
  puts Rainbow("                                                            ").bg(:blue)
  puts Rainbow("------------------------------------------------------------").bg(:blue)
  puts ""
end

def welcome_message
  puts Rainbow("------------------------------------------------------------").bg(:blue)
  puts Rainbow("                                                            ").bg(:blue)
  puts Rainbow("                                                            ").bg(:blue)
  puts Rainbow("    Enter a string, and I'll return the middle letter(s)    ").bg(:blue)
  puts Rainbow('          ( You can enter "q" to exit at any time )         ').bg(:blue)
  puts Rainbow("                                                            ").bg(:blue)
  puts Rainbow("                                                            ").bg(:blue)
  puts Rainbow("------------------------------------------------------------").bg(:blue)
  puts Rainbow("").bg(:blue)
end

system "clear" or system "cls"
welcome_message()

while true do
  input = gets.strip

  puts ""
  if input.downcase == 'q'
    puts "Goodbye!"
    break
  end

  color_shift(fill_screen)
  system "clear" or system "cls"

  middle_letter(input)
end
