class HumanPlayer
attr_reader :name

  def initialize(name)
    @name = name
  end

  def take_guess
    pos = gets.chomp
    format_position(pos)
    rescue
      puts "Sorry, that's not a valid entry! Try again!"
      take_guess
    end
  end

  def format_position(input)
    input.split(',').map(&:to_i).map { |ele| ele - 1 }
  end
end
