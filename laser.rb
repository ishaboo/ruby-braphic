class Laser
  attr_accessor :x, :y
  def initialize
    @laser = Gosu::Image.new("media/laser.htm")
    @name = 'Laser'
    @x = @y = @vel_x = @vel_y = @angle = 1.0
    @speed = 20.5
    @image = Gosu::Image.new(@laser)
  end

  def warp(x, y)
    @x, @y = x, y
  end

  def shoot
  	@vel_x += Gosu.offset_x(@angle, @speed)
  	@vel_y += Gosu.offset_y(@angle, @speed)
  end

  def draw
    @image.draw_rot(@x, @y, 1, @angle)
  end

  def move
    @x += @vel_x
    @y += @vel_y
    @x %= 999
    @y %= 600

    @vel_x *= 0.1
    @vel_y *= 0.1
  end
end
