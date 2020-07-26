class Game

  def won?
    a = WIN_COMBINATIONS.find{
      |combo|
      @board[combo[0]] == "X" && @board[combo[1]] == "X" && @board[combo[2]] == "X"
    }
    b = WIN_COMBINATIONS.find{
      |combo|
      @board[combo[0]] == "O" && @board[combo[1]] == "O" && @board[combo[2]] == "O"
    }
    return a || b
  end


  def move(index, current_player)
    @board[index] = current_player
  end

  def valid_move? (index)
    index.between?(0,8) && !position_taken?(index)
  end

  def current_player
   turn_count % 2 == 0 ? "X" : "O"
  end

  def turn_count
      count = 0
      @board.each do |spaces|
        if spaces == "X" || spaces == "O"
          count += 1
        end
      end
    return count
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

    def full?
      @board.all? {|cell| cell == "X" || cell == "O"}
    end

    def draw?
      if !won?&& full?
        return true
      else
        return false
      end
    end

  def over?
    if won? || draw?
      true
    else
      false
    end
  end

  def winner
    if won?
      @board[won?[0]] == "X" ? "X" : "O"
    else
      nil
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
