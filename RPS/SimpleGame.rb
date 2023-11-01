require 'tk'
require 'gosu'

require_relative "GameLogicHandler.rb"
include GameLogic

require_relative "MusicHandler.rb"
include SoundManagement


LIGHT_PINK_COLOR = '#ffc0cb'
DARK_PINK_COLOR = '#f58e9d'

LIGHT_LAVENDER = '#ccccff'
DARK_LAVENDER ='#7e7ef1'

SKY_BLUE = '#c5e8ff'
DARK_SKY_BLUE ='#79c1f0'


soundPlayer = SoundPlayer.new

winSound = 'WinSound.mp3'
loseSound = 'LoseSound.mp3'

windowWidth = 500
windowHeight = 300

root = TkRoot.new do
  title "Game"
  geometry "#{windowWidth}x#{windowHeight}"
  background '#e0ebd4'
  resizable false, false
end


screenWidth = root.winfo_screenwidth
screenHeight = root.winfo_screenheight


x = screenWidth / 3
y = screenHeight / 4
root.geometry("+#{x}+#{y}")


labelsFont = TkFont.new(family: 'Century Gothic', size: 15)


labelFrame = TkFrame.new(root) do
  pack(side: 'top', fill: 'both', expand: true)
  background '#e0ebd4'
end


TkLabel.new(labelFrame) do
  text "\"Rock paper scissors\" game"
  font labelsFont
  background '#e0ebd4'
  grid(row: 0, column: 1, sticky: 'w', padx: 0, pady: 10)
end


playerLabel = TkLabel.new(labelFrame) do
  text "Player: "
  font labelsFont
  background '#e0ebd4'
  grid(row: 1, column: 0, sticky: 'w', padx: 10, pady: 0)
end


computerLabel = TkLabel.new(labelFrame) do
  text "Computer: "
  font labelsFont
  background '#e0ebd4'
  grid(row: 2, column: 0, sticky: 'w', padx: 10, pady: 0)
end


resultLabel = TkLabel.new(labelFrame) do
  text "Result: "
  font labelsFont
  background '#e0ebd4'
  grid(row: 3, column: 0, sticky: 'w', padx: 10, pady: 10)
end


def defaultLabelSettings(frame, font, text, row)
  labelVariable = TkVariable.new
  labelVariable.value = ".........."

  TkLabel.new(frame) do
    textvariable labelVariable
    font font
    background '#e0ebd4'
    grid(row: row, column: 1, sticky: 'w', padx: 30, pady: 10)
  end

  labelVariable
end


playerAnswerLabel = defaultLabelSettings(labelFrame, labelsFont, "Player Answer", 1)
computerAnswerLabel = defaultLabelSettings(labelFrame, labelsFont, "Computer Answer", 2)
resultAnswerLabel = defaultLabelSettings(labelFrame, labelsFont, "Result", 3)


buttonFont = TkFont.new(family: 'Century Gothic', size: 10)

buttonFrame = TkFrame.new(root) do
  pack(side: 'bottom', fill: 'both', expand: true)
  background '#e0ebd4'
end


if !ARGV.empty? && GameLogic.validationForGameOperands(ARGV[0]) && GameLogic.validationForGameOperands(ARGV[1]) && ARGV.length() == 2
  playerAnswerLabel.value = ARGV[0]
  computerAnswerLabel.value = ARGV[1]
  resultAnswerLabel.value = GameLogic.answer(playerAnswerLabel.value, computerAnswerLabel.value)
  soundPlayer.playSong(resultAnswerLabel.value, winSound, loseSound)
end


def defaultButtonSettings(buttonFrame, text, background, activebackground, font,
                          playerAnswerLabel, computerAnswerLabel, resultAnswerLabel, soundPlayer, winSound, loseSound)
  TkButton.new(buttonFrame) do
    text text
    command {
      playerChoice = text
      availableChoices = [GameLogic::SCISSORS, GameLogic::STONE, GameLogic::PAPER].shuffle
      computerChoice = GameLogic.computer_choice(availableChoices)
      playerAnswerLabel.value = playerChoice
      computerAnswerLabel.value = computerChoice
      resultAnswerLabel.value = GameLogic.answer(playerChoice, computerChoice)
      soundPlayer.playSong(resultAnswerLabel.value, winSound, loseSound)
    }
    pack(side: 'left', padx: 27, pady: 10)
    borderwidth 5
    relief 'raised'
    background background
    foreground 'black'
    activebackground activebackground
    font font
    width 12
    height 1
  end
end


scissorsButton = defaultButtonSettings(buttonFrame, GameLogic::SCISSORS, LIGHT_PINK_COLOR, DARK_PINK_COLOR, buttonFont,
                                       playerAnswerLabel, computerAnswerLabel, resultAnswerLabel, soundPlayer, winSound, loseSound)

stoneButton = defaultButtonSettings(buttonFrame, GameLogic::STONE, LIGHT_LAVENDER, DARK_LAVENDER, buttonFont,
                                    playerAnswerLabel, computerAnswerLabel, resultAnswerLabel, soundPlayer, winSound, loseSound)

paperButton = defaultButtonSettings(buttonFrame, GameLogic::PAPER, SKY_BLUE, DARK_SKY_BLUE,  buttonFont,
                                    playerAnswerLabel, computerAnswerLabel, resultAnswerLabel, soundPlayer, winSound, loseSound)

Tk.mainloop