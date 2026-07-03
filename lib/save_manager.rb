# frozen_string_literal: true

# This class is responsible for saving the current state of the game to a file.
# It provides a method to save the game by serializing the game object and writing it to a file.
class SaveManager
  SAVE_FILE = 'saves/save_file.txt'

  def self.save_game(game)
    File.binwrite(SAVE_FILE, Marshal.dump(game))
  end

  def self.load_game
    return nil unless File.exist?(SAVE_FILE)

    Marshal.load(File.binread(SAVE_FILE)) # rubocop:disable Security/MarshalLoad
  end
end
