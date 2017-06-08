require_relative 'player'
require_relative 'deck'

class Game
  attr_reader :players
  attr_accessor :deck, :player1, :player2, :current_player

  def initialize(player1, player2)
    @player1 = Player.new(player1)
    @player2 = Player.new(player2)
    @players = [@player1, @player2]
    @current_player = @player1
    @deck = Deck.new.deck
    @pot = 0
    give_cards
  end

  def switch_players
    @current_player = (@current_player == @player1 ? @player2 : @player)
  end

  def give_cards
    @players.each do |player|
      5.times { player.hand << @deck.shuffle.pop }
    end
  end

  def play
    blind_bet
    #implement play
  end

  def blind_bet
    2.times.do
      puts "Start bet!!!"
      bet = gets.chomp.to_i
      @current_player.make_bet(bet)
      make_players_bet(bet)
      switch_players
    end
  end

  def make_players_bet(bet)
    @pot += bet
  end
end
