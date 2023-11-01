module GameLogic
  SCISSORS = "Scissors"
  STONE = "Stone"
  PAPER = "Paper"

  def answer(playerChoice, computerChoice)
    if playerChoice == computerChoice
      return "Draw"
    elsif (playerChoice == PAPER && computerChoice == SCISSORS) ||
      (playerChoice == SCISSORS && computerChoice == STONE) ||
      (playerChoice == STONE && computerChoice == PAPER)
      return "You lose. Try again, you'll\ndefinitely be lucky this time!"
    else
      return "YOU WON!!! My congratulations"
    end
  end

  def generateRandVariant()
    allVariantsOfWords = %w[Scissors Stone Paper]
    random = rand(allVariantsOfWords.length)
    return allVariantsOfWords[random]
  end

  def validationForGameOperands(operand)
    operand == SCISSORS || operand == STONE || operand == PAPER
  end

  def minimax(choices, is_max_turn, depth)
    return 0 if depth == 0 || choices.empty?

    if is_max_turn
      max_eval = -Float::INFINITY
      choices.each do |choice|
        eval = minimax(choices.select { |c| c != choice }, false, depth - 1)
        max_eval = [max_eval, eval].max
      end
      max_eval
    else
      min_eval = Float::INFINITY
      choices.each do |choice|
        eval = minimax(choices.select { |c| c != choice }, true, depth - 1)
        min_eval = [min_eval, eval].min
      end
      min_eval
    end
  end

  def computer_choice(choices)
    best_choice = nil
    best_eval = -Float::INFINITY

    choices.each do |choice|
      eval = minimax(choices.select { |c| c != choice }, false, choices.length - 1)
      if eval > best_eval
        best_eval = eval
        best_choice = choice
      end
    end

    best_choice
  end
end