class Messages

  def welcome
    "Welcome to MASTERMIND! \n Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
  end

  def play_begins
    "I have generated a beginner sequence with four elements made up of: (r)ed, (g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game. \n What's your guess?"
  end

  def instructions
    "The computer will generate a secret code using a combination of four different colored pegs (red, green, blue, and yellow). Your goal is to guess the secret combination with as few guesses as possible. Once you begin the game, enter your first guess. The computer will give you feedback regarding correct color and position guesses. Continue guessing until you decipher the secret!"
  end

  def quit
    "Thank you for playing Mastermind, come back again!"
  end

  def too_long
    "Your guess is too long! Please guess again."
  end

  def too_short
    "Your guess is too short! Please guess again."
  end

  def invalid_input
    "Valid input consists of (r)ed, (g)reen, (b)lue, and (y)ellow. Please guess again using these values."
  end

  def goodbye
    "Thanks for playing, goodbye!"
  end

  def input_options
    "I'm sorry, I did not understand you. Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
  end

  def win(input, guess_count, seconds, minutes)
    "Congratulations, you win! You guessed the sequence #{input} in #{guess_count} guesses over #{minutes} minutes and #{seconds} seconds. \n Do you want to (p)lay again or (q)uit?"
  end

  def try_again(input, color, position, guess_count)
    "#{input} has #{color + position} of the correct elements with #{position} in the correct positions. \n You've taken #{guess_count} guess."
  end


end
