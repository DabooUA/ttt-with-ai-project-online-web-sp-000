class Game

  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
                    [0,1,2],
                    [3,4,5],
                    [6,7,8],

                    [0,3,6],
                    [1,4,7],
                    [2,5,8],

                    [0,4,8],
                    [2,4,6]
                  ]
  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def move(index, current_player)
    @board[index] = current_player
  end


  def current_player
    @board.turn_count % 2 == 0 ? player_1 : player_2
  end

  def won?
    WIN_COMBINATIONS.detect do |combination|
      @board.cells[combination[0]] == @board.cells[combination[1]] &&
      @board.cells[combination[1]] == @board.cells[combination[2]] &&
      @board.taken?(combination[0] + 1)
    end
  end

  def draw?
     !won? && @board.full?
  end

  def over?
    won? || draw?
  end

  def winner
    if winning_combination = won?
      @winner = @board.cells[winning_combination.first]
    else
      nil
    end
  end


  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    p_token = current_player
  if valid_move?(index)
    move(index, p_token)
    display_board
  else
    turn
    end
  end

  def play
    until over? == true
      turn
    end

    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"

    end
  end

end
