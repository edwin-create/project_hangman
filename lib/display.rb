# frozen_string_literal: true

# This class is responsible for displaying the game state to the player.
class Display
  def welcome
    puts 'Welcome to Hangman!'
    puts
    puts 'Guess one letter at a time.'
    puts 'You have 6 incorrect guesses.'
    puts "Type 'save' at any time to save your game."
    puts
  end

  def show_board(board)
    puts
    puts 'Word:'
    puts board.display_word
    puts
    puts "Incorrect guesses: #{board.incorrect_guesses.join(', ')}"
    puts "Remaining guesses: #{board.remaining_guesses}"
    puts
  end

  def prompt_for_guess
    print 'Enter a letter to guess (or type "save" to save the game): '
    gets.chomp.downcase
  end

  def show_guess_result(result)
    case result
    when :correct
      puts 'Correct guess!'
    when :incorrect
      puts 'Incorrect guess!'
    when :already_guessed
      puts 'You already guessed that letter.'
    end
  end

  def show_invalid_guess
    puts 'Invalid guess. Please enter a single letter.'
  end

  def show_win(secret_word)
    puts "Congratulations! You've guessed the word: #{secret_word}"
  end

  def show_loss(secret_word)
    puts "Game over! The word was: #{secret_word}"
  end

  def show_game_saved
    puts 'Game saved!'
  end
end
