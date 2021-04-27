# Blackjack
# -------------
# by Jay Mullen

def random_card
  cards = ["two", "three", "four", "five", "six", "seven",
         "eight", "nine", "ten",
         "jack", "queen", "king", "ace"]

  cards[rand(13)]
end

def move
  print "Hit or stick? "

  while choice = gets.chomp.downcase
    if choice == "hit" || choice == "stick"
      return choice
    end

    print "Hit or stick? "
  end
end

def score(hand)
  total = 0

  hand.each do |card|
    card_value = \
    case card
      when "two" then 2
      when "three" then 3
      when "four" then 4
      when "five" then 5
      when "six" then 6
      when "seven" then 7
      when "eight" then 8
      when "nine" then 9
      when "ten", "jack", "queen", "king" then 10
      when "ace" then 11
    end

    total += card_value
  end

  return total
end

def run_game
  hand = Array.new

  while move
    if move == "hit"
      hand << random_card
      puts "Score so far: #{score(hand)}"
    elsif move == "stick"
      if score(hand) > 21
        puts "You busted with: #{score(hand)}"
      else
        puts "You scored: #{score(hand)}"
      end

      break
    end
  end
end

run_game
