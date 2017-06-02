require_relative 'player.rb'

class Game
  attr_reader :fragment, :dictionary

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @fragment = ""
    @dictionary = File.readlines("dictionary.txt").map(&:strip)
    @current = @player1
    @loss_hash = { @player1 => 0, @player2 => 0 }
  end

  # def play_game
  #   until won_round?
  #     take_turn(@current)
  #     next_player!
  #   end
  #   if won_round?
  #     puts "Congratulations! #{@current.name} won the round!"
  #     next_player!
  #     losses(@current)
  #     puts record(@current)
  #     unless game_over?
  #       @fragment = ""
  #       take_turn(@current)
  #     else
  #       next_player!
  #       puts "#{@current.name} is the final winner!!!!!!!!"
  #     end
  #   end
  # end

  def play_game
    until game_over
      until won_round?
        take_turn(@current)
        next_player!
      end
      puts "Congratulations! #{@current.name} won the round!"
      next_player!
      losses(@current)
      puts record(@current)
    end

  end

  def game_over?
    loss_hash.values.include?(5)
  end

  def won_round?
    @dictionary.each do |word|
      return true if word == @fragment
    end
    false
  end

  def next_player!
    @current == @player1 ? @current = @player2 : @current = @player1
  end

  def take_turn(player)
    letter = player.guess
    if valid_play?(letter)
      @fragment += letter
    else
      puts "Invalid move, try again!"
      take_turn(player)
    end
  end

  def valid_play?(string)
    return false if !("a".."z").to_a.include?(string)
    frag = @fragment
    frag += string
    @dictionary.each do |word|
      return true if word[0...frag.length] == frag
    end
    false
  end

  def losses(player)
    @loss_hash[player] += 1
  end

  def record(player)
    case @loss_hash[player]
    when 1
      return "G"
    when 2
      return "GH"
    when 3
      return "GHO"
    when 4
      return "GHOS"
    when 5
      return "GHOST"
    end
  end

end

if __FILE__ == $PROGRAM_NAME
  p1 = Player.new("Alex")
  p2 = Player.new("Young")
  g = Game.new(p1, p2)
  g.play_game
end
