class Human < Player

  def move(index, current_player)
    cells[index] = current_player
  end

end
