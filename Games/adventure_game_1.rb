# A text-based adventure game (basic)
# -------------
# by Jay Mullen

room = "passage"

while true
  direction = gets.chomp.downcase

  if room == "passage"
    if direction == "north"
      room = "cave"
      puts "You are in a scary cave."
    end

  else
    if direction == "south"
      room = "passage"
      puts "You are in a scary passage."
    elsif direction == "north"
      puts "You walk into sunlight."
      break
    end
  end
end
