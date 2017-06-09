class Card
  attr_accessor :face_value
  attr_reader :face_up

  def initialize
    @face_value = nil
    @face_up = false
  end

  def face_toggle
    @face_up = (@face_up ? false : true)
  end

  def card_display
    @face_up ? @face_value.to_s : '#'
  end
end
