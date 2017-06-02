class Card
  attr_accessor :face_value
  attr_reader :face_up

  def initialize
    @face_value
    @face_up = false
  end

  def face_toggle
    @face_up ? @face_up = false : @face_up = true
  end

  def card_display
    @face_up ? @face_value.to_s : "#"
  end
end

# if __FILE__ == $PROGRAM_NAME
#   c = Card.new
#   c.face_value = 4
#   p c.face_value
#   p c.card_display
#   c.flip_card
#   p c.card_display
# end
