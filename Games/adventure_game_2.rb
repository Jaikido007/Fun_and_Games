# SAFE HAVEN
# ----------
# A text-based adventure game
# by Jay Mullen

room = "hall"

while true
  command = gets.chomp.downcase

  if room == "hall"
    if command == "north"
      puts "Move to the study."
      room = "study"
    elsif command == "look"
      puts "You are standing in a hall with a marble floor. You see a door."
    elsif command == "quit"
      puts "Bye!"
      break
    end

  else
    if command == "south"
      puts "Move to the hall."
      room = "hall"
    elsif command == "look"
      puts "You are in a warm and cosy study. You see a safe. You see a desk."
    elsif command == "look at desk"
      puts "You see a piece of paper that reads, The combination is 2451."
    elsif command == "enter combination 2451"
      puts "You see some diamonds in the safe, pick them up and make your escape"
      break
    elsif command == "quit"
      puts "Bye!"
      break
    end
  end
end
