require 'gosu'
module SoundManagement

  class SoundPlayer
    def initialize
      @win = Gosu::Window.new(1, 1, false)
    end

    def playSound(path, volume)
      sample = Gosu::Sample.new(@win, path)
      sample.play(volume)
    end

    def playSong(result, winPath, losePath)
      if result.include?("WON")
        playSound(winPath, 0.5)
      elsif result.include?("lose")
        playSound(losePath, 0.1)
      end
    end
  end

end