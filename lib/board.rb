class Board

  attr_accessor :cells

  def initialize
    reset!
    #@board = board || Array.new(9, " ")
  end

  def self.display
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    @display
  end

  def self.reset!
    board.clear
  end

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def position(index)
    !(@board[index].nil? || @board[index] == " ")
  end


end
