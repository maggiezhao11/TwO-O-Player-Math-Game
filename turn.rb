class Turn
  attr_accessor :question, :player

  def initialize(question, result, player)
    @question = question
    @result = result
    @player = player
  end

  def question
    puts "what does #{rand(20)} plus #{rand(20)} equal "
  end

  def update_lives(result)
    if result == won
      player.live += 1
    else 
      player.live -= 1
  end

end