class Board

  attr_accessor :cells

  def initialize
    reset!
    #@board = board ||
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def reset!
    @cells = Array.new(9, " ")
  end

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def position(index)
    !(@board[index].nil? || @board[index] == " ")
  end


end
