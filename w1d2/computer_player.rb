class ComputerPlayer
  attr_reader :known_matches

  def initialize(name)
    @name = name
    @known_cards = {}
    @known_matches = []
    @all_positions = [0, 1, 2, 3].repeated_permutation(2)
  end

  def receive_revealed_card(pos, val)
    @known_cards[pos] = val
  end

  def check_matches(pos, card)
    @known_cards.each do |k, v|
      if v == card.face_value && pos != k
        @known_cards[pos] = v
        @known_matches << [pos, k]
      end
    end
  end

  def take_guess(last_guess)
    last_guess ? second_guess(last_guess) : first_guess
  end

  private

  def second_guess(last_guess)
    if @known_matches.empty?
      random_pos
    else
      match = @known_matches.select { |ele| ele.include?(last_guess) }
      unmatched_card = (match - last_guess).flatten
      unmatched_card
    end
  end

  def first_guess
    if @known_matches.empty?
      random_pos
    else
      @known_matches[0][0]
    end
  end

  def random_pos
    known_positions = @known_cards.keys
    unknown_positions = @all_positions - known_positions
    unknown_positions.sample
  end
end
