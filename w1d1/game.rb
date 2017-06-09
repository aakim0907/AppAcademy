require_relative 'player.rb'

class Game
  attr_reader :fragment, :dictionary

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @dictionary = File.readlines(dictionary.txt).map(&:strip)
    @current = @player1
    @loss_hash = { @player1 => 0, @player2 => 0 }
  end

  def play_game
    play_round until game_over?
    next_player!
    puts "Congrats! #{@current.name} won the game!!!"
  end

  def play_round
    @fragment = ''
    take_turn(@current) until won_round?
    puts "Congratulations! #{@current.name} won the round!"
    track_score
  end

  def game_over?
    loss_hash.values.include?(5)
  end

  def won_round?
    @dictionary.include?(@fragment)
  end

  def next_player!
    @current = (@current == @player1 ? @player2 : @player1)
  end

  def take_turn(player)
    letter = player.guess
    if valid_play?(letter)
      @fragment += letter
    else
      puts 'Invalid move, try again!'
      take_turn(player)
    end
    next_player!
  end

  def valid_play?(string)
    return false unless ('a'..'z').to_a.include?(string)
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

  def track_score
    losses(@current)
    puts "#{@current.name}: #{record(@current)}"
    @fragment = ''
  end

  def record(player)
    score = @loss_hash[player]
    'GHOST'[0...score]
  end

end

if __FILE__ == $PROGRAM_NAME
  p1 = Player.new("Alex")
  p2 = Player.new("Young")
  g = Game.new(p1, p2)
  g.play_game
end
