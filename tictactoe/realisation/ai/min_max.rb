# class MinMax
#   def next_move game
#     min_max(game)[1]
#   end

#   def name
#     "Minual Maximillion"
#   end

# private
#   def min_max game
#     return [score(game), nil] if game.over?

#     scores = []

#     game.board.get_available_positions.each do |move|
#       possible_game = game.new_game(move)
#       score = min_max(possible_game)[0]
#       scores << [score, move]
#     end

#     if game.current_player.mark == "X"
#       scores.max
#     else
#       scores.min
#     end
#   end

#   def score game
#     if game.winner.nil?
#       0
#     elsif game.winner.mark == "X"
#       +1
#     elsif game.winner.mark == "O"
#       -1
#     end
#   end
# end


class MinMax
  def next_move(game)
    min_max(game, -Float::INFINITY, Float::INFINITY)[1]
  end

  def name
    "Minual Maximillion"
  end

  private

  def min_max(game, alpha, beta)
    return [score(game), nil] if game.over?

    scores = []
    game.board.get_available_positions.each do |move|
      possible_game = game.new_game(move)
      score = min_max(possible_game, alpha, beta)[0]
      scores << [score, move]

      if game.current_player.mark == "X"
        alpha = [alpha, score].max
      else
        beta = [beta, score].min
      end

      break if alpha >= beta
    end

    if game.current_player.mark == "X"
      scores.max_by { |s, _| s }
    else
      scores.min_by { |s, _| s }
    end
  end

  def score(game)
    if game.winner.nil?
      0
    elsif game.winner.mark == "X"
      +1
    elsif game.winner.mark == "O"
      -1
    end
  end
end