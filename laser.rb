class Laser
  def initialize
    @laser = Gosu::Image.new("media/laser.htm")
    @name = 'Laser'
    @x = @y = @vel_x = @vel_y = @angle = 5.5
    @speed = 0.6
    @image = Gosu::Image.new(@laser)
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

    @vel_x *= 0.95
    @vel_y *= 0.95
  end
end
