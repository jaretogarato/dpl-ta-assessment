def middle_letter(input)

  len = input.length
  # puts "LEN"
  # puts len

  if len % 2 == 0
    char1 = input[(len / 2 - 1).to_i]
    char2 = input[(len / 2).to_i]

    puts "Your string was of an even number of characters."
    puts ("These are middle two characters: #{char1}, #{char2}")
    # puts "char1"
    # puts char1
    # puts "char2"
    # puts char2
  else
    # puts ((len / 2).to_i)
    char1 = input[(len / 2).to_i]
    # puts "odd char 1"
    # puts char1
    puts "Your string was of an odd number of characters."
    puts ("This is the middle character: #{char1}")
  end

  puts ""
  puts 'Enter another string, or type q to exit'
end

def welcome_message
  puts "------------------------------------------------------"
  puts " Enter a string, and I'll return the middle letter(s) "
  puts '       ( You can enter "q" to exit at any time )      '
  puts "------------------------------------------------------"
  puts ""
end


welcome_message()

while true do
  input = gets.strip
  if input.downcase == 'q'
    puts "Goodbye!"
    break
  end
  middle_letter(input)
end
