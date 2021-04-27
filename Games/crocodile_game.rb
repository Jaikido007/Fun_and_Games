# CROCODILE CAPER
# ---------------
# by Jay Mullen

# player = "P"

river = "-----,--C--,CC-CC,CC-CC"
position = 2
counter = 0

while counter <= 3
  river_arr = river.split(",")
  if river_arr[counter][position] == "C"
    puts "You were eaten."
    break
  else
    river_arr[counter][position] = "P"
  end
  puts river_arr
  if counter == 3
    puts "You survived!"
    break
  else
    puts "Type left, right or neither"
    user_input = gets.chomp.downcase
    if user_input == "right"
      position += 1
  elsif user_input == "left"
    position -= 1
  elsif user_input == "neither"
    position == 0
    end
  end
  counter += 1
end
