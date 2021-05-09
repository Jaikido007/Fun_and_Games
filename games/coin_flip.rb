# HEAD or TAILS
# -------------
# by Jay Mullen

puts "Heads or Tails?"
puts ""

def coin_flip
  coin = rand(1..2)
  puts coin.even? ? "Heads" : "Tails"
end

coin_flip
