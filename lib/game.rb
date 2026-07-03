# frozen_string_literal: true

# This game class is responsible for managing the overall flow of the Hangman game.
# It initializes the game by selecting a random word from the dictionary and creating a new board with that word.
# The Game class will also handle user input, game state updates, and determining win/loss conditions.
class Game
  def initialize
    @dictionary = Dictionary.new
    @secret_word = @dictionary.random_word
    @board = Board.new(@secret_word)
    @display = Display.new
  end

  def play # rubocop:disable Metrics/MethodLength
    @display.welcome

    until game_over?
      @display.show_board(@board)

      guess = @display.prompt_for_guess

      if save_requested?(guess)
        SaveManager.save_game(self)
        @display.show_game_saved
        next

      end

      unless valid_guess?(guess)
        @display.show_invalid_guess
        next
      end
      result = @board.guess(guess)
      @display.show_guess_result(result)
    end
    finish_game
  end

  def game_over?
    @board.lost? || @board.won?
  end

  def finish_game
    if @board.won?
      @display.show_win(@secret_word)
    else
      @display.show_loss(@secret_word)
    end
  end

  def valid_guess?(guess)
    guess.length == 1 && guess.match?(/[a-zA-Z]/)
  end

  def save_requested?(guess)
    guess == 'save'
  end
end
