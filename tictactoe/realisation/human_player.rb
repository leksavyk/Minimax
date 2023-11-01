require_relative 'player'

class HumanPlayer
  include Player

  def next_move game
    puts "\nYour turn (you are #{mark}). Numbers represent locations:"
    game.board.display

    loop do
      position = input_position game.board
      if position.nil?
        puts "\nInvalid input. Try again!"
      else
        return position
      end
    end
  end

  def name
    "\nYou"
  end

private
  def input_position board
    user_input = STDIN.gets.chomp.to_i
    board.valid_position?(user_input) ? user_input : nil
  end
end
