# GOBLIN LOVER
# -------------
# by Jay Mullen
#
# Game rules:  Set your goblin names anmd watch them battle it out to be the
# first Goblin to reach 5 loving hugs.
# In the event of a tie - it goes to 'sudden death' - revealing the ultimate
# Goblin Lover!
#
# Enjoy

class GoblinLover
  # Initialise our two arrays to hold the results of the penalties
  def initialize
    @score_p1 = Array.new
    @score_p2 = Array.new
  end

  # Take a cuddle and return either 0 (miss) or 1 (hugged)
  def cuddle
    attempt = [0, 1]
    hug = attempt.sample
  end

  # Return a random celebration after a successful cuddle
  def celebration
    cuddled = [ "*** What a cuddle! ***",
      "*** That's a giant squeeze! ***",
      "*** So much ,love, my heart is full! ***",
      "*** I will hug him and squeeze him and call him George! ***",
      "*** Hugsy time ***" ]

    cuddled.sample
  end

  # Return a random commiseration after a cuddle is refused
  def commiseration
    missed = [ "*** You cuddled yourself instead! ***",
      "*** You don't have consent for a cuddle, maybe you should ask first! ***",
      "*** It's not who you thought it was!  You keep running past them and pretend you see another Goblin in the distance! ***",
      "*** You decide not to invade their personal space! ***",
      "*** You hugged their friend by mistake.  Should've gone to SpecSavers! ***" ]

    missed.sample
  end

  # Pass two scores to be checked, returning 1 if player 1 is winning, 2 if player 2 is winning and 0 if they are level
  def score_check(t1, t2)
    if t1 > t2
      result = 1
    elsif t2 > t1
      result = 2
    else
      result = 0
    end

    return result
  end

  # Main game code
  def run_game
    print "Goblin 1 enter your name: "
    puts ""
    p1 = gets.chomp.capitalize
    print "\nGoblin 2 enter your name: "
    puts ""
    p2 = gets.chomp.capitalize

    tie = 0 # Flag to indicate whether the players were level after the original 5 penalties
    counter = 0
    while counter < 5
      counter += 1

      puts "\n#{p1}, it's cuddle time.\n\n"
      # Get the outcome of a penalty, store it in player 1's array and spit out an appropriate message
      outcome = cuddle
      @score_p1 << outcome
      if outcome == 1
        puts celebration
      else
        puts commiseration
      end

      puts "\n#{p2}, you're up next.\n\n"
      # Get the outcome of a penalty, store it in player 2's array and spit out an appropriate message
      outcome = cuddle
      @score_p2 << outcome
      if outcome == 1
        puts celebration
      else
        puts commiseration
      end

      total_p1 = @score_p1.inject(0, :+) # Sum of all cuddles, i.e. total score
      total_p2 = @score_p2.inject(0, :+)

      # If we have just executed the fifth cuddle and the scores are level, decrease the counter so we take another round of cuddles and set the "tie" flag
      if counter == 5 && score_check(total_p1, total_p2) == 0
        counter -= 1
        tie = 1
      end
    end

    total_p1 = @score_p1.inject(0, :+)
    total_p2 = @score_p2.inject(0, :+)

    # If the match was tied after 5 cuddles, output a message to that effect
    if tie == 1
      puts "\nAfter 5 cuddles the scores were level...\n"
    end

    # Compare the players' scores and print a message prnouncing the winner
    # Now that wsudden death is implemented, it should never be a draw
    if score_check(total_p1, total_p2) == 1
      puts "\n#{p1} wins #{total_p1} hugs - #{total_p2}"
    elsif score_check(total_p1, total_p2) == 2
      puts "\n#{p2} wins #{total_p2} hugs - #{total_p1}"
    else
      puts "\nIt's a draw! #{total_p1} - #{total_p2}"
    end
  end
end

game = GoblinLover.new
game.run_game
