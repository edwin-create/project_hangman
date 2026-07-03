# frozen_string_literal: true

require_relative 'lib/board'
require_relative 'lib/game'
require_relative 'lib/dictionary'
require_relative 'lib/display'
require_relative 'lib/save_manager'

puts '===================='
puts '      HANGMAN'
puts '===================='
puts
puts '1. New Game'
puts '2. Load Game'
print 'Choose an option: '

choice = gets.chomp

if choice == '1'
  game = Game.new
elsif choice == '2'
  game = SaveManager.load_game
  if game.nil?
    puts 'No saved game found. Starting a new game.'
    game = Game.new
  end
else
  puts 'Invalid choice. Starting a new game.'
  game = Game.new
end

game.play
