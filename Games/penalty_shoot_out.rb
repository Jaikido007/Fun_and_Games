class ShootOut
  # Initialise our two arrays to hold the results of the penalties
  def initialize
    @score_p1 = Array.new
    @score_p2 = Array.new
  end

  # Take a penalty and return either 0 (miss) or 1 (goal)
  def penalty
    shoot = [0, 1]
    goal = shoot.sample
  end

  # Return a random celebration after a goal is scored
  def celebration
    scored = [ "*** What a goal! ***",
      "*** Back of the net! ***",
      "*** The goalie didn't stand a chance! ***",
      "*** GOOOAAAAALLLLL!!! ***",
      "*** There was no stopping that! ***" ]

    scored.sample
  end

  # Return a random commiseration after a goal is missed
  def commiseration
    missed = [ "*** How did you miss that! ***",
      "*** Oh, it's wide! ***",
      "*** The goalie just got his fingers to that one! ***",
      "*** I don't know where that's gone, but it's not in the net! ***",
      "*** Should've gone to SpecSavers! ***" ]

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
    print "Player 1 enter your name: "
    puts ""
    p1 = gets.chomp.capitalize
    print "\nPlayer 2 enter your name: "
    puts ""
    p2 = gets.chomp.capitalize

    tie = 0 # Flag to indicate whether the players were level after the original 5 penalties
    counter = 0
    while counter < 5
      counter += 1

      puts "\n#{p1}, you're up.\n\n"
      # Get the outcome of a penalty, store it in player 1's array and spit out an appropriate message
      outcome = penalty
      @score_p1 << outcome
      if outcome == 1
        puts celebration
      else
        puts commiseration
      end

      puts "\n#{p2}, you're up next.\n\n"
      # Get the outcome of a penalty, store it in player 2's array and spit out an appropriate message
      outcome = penalty
      @score_p2 << outcome
      if outcome == 1
        puts celebration
      else
        puts commiseration
      end

      total_p1 = @score_p1.inject(0, :+) # Sum of all penalties, i.e. total score
      total_p2 = @score_p2.inject(0, :+)

      # If we have just taken the fifth penalty and the scores are level, decrease the counter so we take another round of penalties and set the "tie" flag
      if counter == 5 && score_check(total_p1, total_p2) == 0
        counter -= 1
        tie = 1
      end
    end

    total_p1 = @score_p1.inject(0, :+)
    total_p2 = @score_p2.inject(0, :+)

    # If the match was tied after 5 penalties, output a message to that effect
    if tie == 1
      puts "\nAfter 5 penalties the scores were level...\n"
    end

    # Compare the players' scores and print a message prnouncing the winner
    # Now that we've implemented sudden death, it should never be a draw
    if score_check(total_p1, total_p2) == 1
      puts "\n#{p1} wins #{total_p1} - #{total_p2}"
    elsif score_check(total_p1, total_p2) == 2
      puts "\n#{p2} wins #{total_p2} - #{total_p1}"
    else
      puts "\nIt's a draw! #{total_p1} - #{total_p2}"
    end
  end
end

game = ShootOut.new
game.run_game
