# frozen_string_literal: true

# This class represents a dictionary of words for the Hangman game
# It is responsible for loading a list of words from a file and providing a method to select a random word from the list
class Dictionary
  FILE_PATH = 'data/google-10000-english-no-swears.txt'

  def initialize
    @words = File.readlines(FILE_PATH, chomp: true).filter { |word| word.length.between?(5, 12) }
  end

  def random_word
    @words.sample
  end
end
