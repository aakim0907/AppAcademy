class Tower
  attr_reader :grid

  def initialize(grid = [[3,2,1],[],[]])
    @grid = grid
  end

  def move(move_pos)
    raise 'invalid argument' unless move_pos.length == 2
    start_disc = @grid[move_pos[0]]
    end_disc = @grid[move_pos[1]]
    if start_disc.last > end_disc.last && !end_disc.empty?
      raise 'No! Can\'t move!'
    end
    disc = start_disc.pop
    end_disc << disc
    @grid
  end

  def won?
    return false unless @grid[0].empty?
    return true if @grid[1].length == 3 || @grid[2].length == 3
  end

  def play_game
    until won?
      puts @grid
      user_move = gets.split(',').map(&:to_i)
      move(user_move)
    end
    puts @grid
    puts 'You won!'
  end

end
