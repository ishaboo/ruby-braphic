require 'gosu'
require './player.rb'
require './laser.rb'
require 'pry-byebug'

class Tutorial < Gosu::Window

  def initialize
    super 999, 600
    self.caption = "Jet of Space"
    @num = rand(2)
    if @num == 1
      @space = "media/space.png"
    else
      @space = "media/space.htm"
    end
    @background_image = Gosu::Image.new(@space, :tileable => true)

    @player = Player.new
    @laser = Laser.new
    @player.warp(300, 300)
  end

  def update
    if Gosu.button_down? Gosu::KB_LEFT or Gosu::button_down? Gosu::GP_LEFT
      @player.turn_left
    end
    if Gosu.button_down? Gosu::KB_RIGHT or Gosu::button_down? Gosu::GP_RIGHT
      @player.turn_right
    end
    if Gosu.button_down? Gosu::KB_UP or Gosu::button_down? Gosu::GP_BUTTON_0
      @player.accelerate
    end
    if Gosu.button_down? Gosu::KB_DOWN or Gosu::button_down? Gosu::GP_BUTTON_0
      @player.backwards
    end
    @player.move

    if Gosu.button_down? Gosu::KB_SPACE
      # binding.pry
      @laser.warp(@player.x, @player.y)
      @laser.shoot
      @laser.move
    end
  end

  def draw
    @player.draw
    @laser.draw
    @background_image.draw(0, 0, 0)
  end

  def button_down(id)
    if id == Gosu::KB_ESCAPE
      close
    else
      super
    end
  end
end

Tutorial.new.show
