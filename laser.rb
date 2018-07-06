class Laser 
  def initialize
    @laser = Gosu::Image.new("media/laser.htm")
    @x = @y = @vel_x = @vel_y = @angle = 0.0
    @speed = 0.6   
  end

  def shoot
  	@vel_x += Gosu.offset_x(@angle, @speed)
  	@vel_y += Gosu.offset_y(@angle, @speed)
  end
end
