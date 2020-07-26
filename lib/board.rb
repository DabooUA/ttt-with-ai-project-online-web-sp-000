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

  def input_to_index(input)
    @cells[input.to_i - 1]
  end

  def full?
    @cells.all? {|c| c == "X" || c == "O"}
  end

  def turn_count
    @cells.count{|c| c == "X" || c == "O"}
  end

  def position(index)
    !(@board[index].nil? || @board[index] == " ")
  end


end
