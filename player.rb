class Player
  PLAYER_LIVE = 3
  attr_accessor :name, :live

  def initialize(name)
    @name = name
    @live = PLAYER_LIVE
  end

  def lose_life 
    @live -= 1
  end

end



