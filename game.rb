require "./player"
require "./question"

class Game
  attr_accessor :turn


  def initialize
    @game_status = 1
    @counter = 0   # when its odd, player1. even for player2
    @player1 = Player.new("player1")
    @player2 = Player.new("player2")
    @current_player = @player1

  end


  def check_live_status
      if @current_player.live == 0
        switch_player
        puts "Good bye! game is finished."
        puts "the winnder is #{@current_player.name}."
        @game_status = 0
      end
    
  end


  def start_game
    until @game_status == 0
      question = Question.new
      puts "#{@current_player.name}: what does #{question.num1} plus #{question.num2} equal "
      response = gets.chomp
      puts "response, #{response}"
      puts "question.answer, #{question.answer}"
      if Integer(response) != Integer(question.answer)
        puts "Seriously? No!"
        @current_player.lose_life 
        check_live_status
      elsif Integer(response) == Integer(question.answer)
        puts "YES! You are correct."
      end
      switch_player

    end
  end

  def switch_player
    @counter += 1
    @current_player = get_current_player()
  end

  def get_current_player
    if (@counter).remainder(2) == 0
      @player1
    else 
      @player2
    end
  end

end