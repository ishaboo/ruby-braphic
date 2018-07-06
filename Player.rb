class Player
  def initialize
    @num = rand(5)
    if @num == 1
      @ship = "media/spaceflyer.htm"
      @name = "spaceflyer"
      @speed = 0.7
    elsif @num == 2
      @ship = "media/starfighter.bmp"
      @name = "starfighter"
      @speed = 0.6
    elsif @num == 3
      @ship = "media/spacesucker.htm"
      @name = "spacesucker"
      @speed = 0.6
    elsif @num == 4
      @ship = "media/fastone.htm"
      @name = "Fast One"
      @speed = 0.8
    elsif @num == 5
      @ship = "media/rebelsBull.htm"
      @name = "Bull"
      @speed = 0.6
    else
      @ship = "media/turtleship.htm"
      @name = "Turtle"
      @speed = 0.5
    end
    puts "Welcome #{@name}"
    @image = Gosu::Image.new(@ship)
    @x = @y = @vel_x = @vel_y = @angle = 0.0
  end

 # def shoot
  #  @laser.fire(@angle)
 # end

  def warp(x, y)
    @x, @y = x, y
  end
  
  def turn_left
    @angle -= 4.5
  end
  
  def turn_right
    @angle += 4.5
  end
  
  def accelerate
    @vel_x += Gosu.offset_x(@angle, @speed)
    @vel_y += Gosu.offset_y(@angle, @speed)
  end

  def backwards
    @vel_x += Gosu.offset_x(@angle, -@speed)
    @vel_y += Gosu.offset_y(@angle, -@speed)
  end
  
  def move
    @x += @vel_x
    @y += @vel_y
    @x %= 999
    @y %= 600
    
    @vel_x *= 0.95
    @vel_y *= 0.95
  end

  def draw
    @image.draw_rot(@x, @y, 1, @angle)
  end
end

