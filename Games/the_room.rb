# THE ROOM
# -------------
# by Jay Mullen

puts "\nWhat is your name? \n\n"
user_name = gets.chomp.capitalize
puts ""

if user_name == "Mark"
  puts "Oh, hi Mark."
elsif user_name == "Lisa"
  puts "YOU'RE TEARING ME APART, LISA!!!!"
elsif user_name == "Johnny"
  puts "Johnny's my best friend!"
elsif user_name == "Peter"
  puts "Chicken, Peter, you're just a little chicken.  Cheep, cheep, cheep, cheep, cheep."
elsif user_name == ""
  puts "It's bullshit, I did not hit her.  I did nooooooot."
elsif user_name == "Denny"
  puts "Denny, do you have something else to do?"
else
  puts "Oh, hi " + user_name + ".  I'm so happy to have you as my best friend, and I love Lisa so much."
end
