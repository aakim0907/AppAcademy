require_relative 'board.rb'
require_relative 'card.rb'
require_relative 'human_player.rb'
require_relative 'computer_player.rb'

class Game
  attr_reader :last_guess

  def initialize(board, human_player, comp_player)
    @board = board
    @human_player = human_player
    @comp_player = comp_player
    @last_guess = nil
  end

  def play_game
    @board.generate_deck
    @board.populate_board
    until @board.won?
      take_turn
    end
    # puts "You Win, #{@player.name}!!!!!"
  end

  def take_turn
    puts "Pick a card (ex. row, col)"
    guess_one = process_guess(#player)
    @last_guess = guess_one[0]
    puts "Pick a second card (ex. row, col)"
    guess_two = process_guess(#player)
    @last_guess = nil
    if guess_one[1].face_value == guess_two[1].face_value
      puts "Congrats! You made a pair. Play again!"
      process_match(guess_one[0])
    else
      puts "Aw man! Those cards don't match. Try again!"
      guess_one.face_toggle
      guess_two.face_toggle
    end
    sleep(2)
    system("clear")
    @board.render
  end

  def process_match (pos)
    @comp_player.known_matches.reject{ |arr| arr.include?(pos) }
  end

  def process_guess(player)
    pos = player.take_guess
    guessed_card = board.flip_card(pos)
    @comp_player.receive_revealed_card(pos, guessed_card.face_value)
    @comp_player.check_matches(pos, guessed_card)
    system("clear")
    board.render
    [pos, guessed_card]
  end
end

if __FILE__ == $PROGRAM_NAME
  b = Board.new
  hp = HumanPlayer.new('player1')
  g = Game.new(b, hp)
  g.play_game
end
