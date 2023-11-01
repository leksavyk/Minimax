require_relative "../realisation/tictactoe"

computer = ComputerPlayer.new("X", ARGV[0] == "min_max" ? :min_max : :random)
human = HumanPlayer.new("O")

game = Tictactoe.new [computer, human]

game.play_the_game
winner = game.winner

if winner.nil?
  puts "\nNo winner this time. Try again!"
else
  puts "\nWinner: #{winner.name} as #{winner.mark}."
end
