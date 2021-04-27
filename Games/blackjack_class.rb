# Blackjack
# -------------
# by Jay Mullen

# This is the same as my file: Blackjack but written with a class system

class Blackjack
  def initialize
    @hand = Array.new
  end

  def random_card
    cards = ["two", "three", "four", "five", "six", "seven",
           "eight", "nine", "ten",
           "jack", "queen", "king", "ace"]

    cards[rand(13)]
  end

  def card_value (single_card)
    case single_card
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
  end

  def move (choice)
    if choice == "hit"
      single_card = random_card
      @hand << single_card
      puts "Score so far: #{score(@hand)}"
    elsif choice == "stick"
      if score(@hand) > 21
        puts "You busted with: #{score(@hand)}"
      else
        puts "You scored: #{score(@hand)}"
      end
    end
  end

  def score (hand)
    total = 0

    hand.each { |single_card| total += card_value(single_card) }

    return total
  end

  def run_game
    print "Hit or stick? "
    while choice = gets.chomp.downcase
      move(choice)
      if choice == "stick"
        break
      end
      print "Hit or stick? "
    end
  end

end

game = Blackjack.new
game.run_game
