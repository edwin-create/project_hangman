# frozen_string_literal: true

# This class represents the game board for Hangman. It keeps track of the secret word, correct guesses,
# incorrect guesses, and remaining guesses.
# It also provides a method to display the current state of the word with underscores for unguessed letters.

# Class Board represents the game board for Hangman.
class Board
  def initialize(secret_word)
    @secret_word = secret_word
    @incorrect_guesses = []
    @correct_guesses = []
    @remaining_guesses = 6
  end

  def display_word
    @secret_word.chars.map do |letter|
      if @correct_guesses.include?(letter)
        letter
      else
        '_'
      end
    end.join(' ')
  end

  def already_guessed?(letter)
    @correct_guesses.include?(letter) || @incorrect_guesses.include?(letter)
  end

  def guess(letter)
    return :already_guessed if already_guessed?(letter)

    if @secret_word.include?(letter)
      @correct_guesses << letter
      :correct
    else
      @incorrect_guesses << letter
      @remaining_guesses -= 1
      :incorrect
    end
  end

  def lost?
    @remaining_guesses.zero?
  end

  def won?
    @secret_word.chars.all? { |letter| @correct_guesses.include?(letter) }
    # (@secret_word.chars - @correct_guesses).empty?
  end
end
