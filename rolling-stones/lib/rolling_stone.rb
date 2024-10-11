class RollingStone
  def movement(map, position, movement_list)

    length_map_i = map.length
    length_map_j = map[0].length
    count = 0
    movement_list = movement_list.chars
    amount_of_movements = movement_list.length
    
    def calc_next_position(movement, position, length_map_i, length_map_j, map)
      next_position = [position[0],position[1]]
      if movement == 'E'
        next_position[1] = position[1] - 1
      elsif movement == 'D'
        next_position[1] = position[1] + 1
      elsif movement == 'C'
        next_position[0] = position[0] - 1
      elsif movement == 'B'
        next_position[0] = position[0] + 1
      end
      
      if next_position[0] >= 0 && next_position[0] < length_map_i && next_position[1] >= 0 && next_position[1] < length_map_j && map[next_position[0]][next_position[1]] != 'X'
        return next_position
      else
        return position
      end
    end

    while count < amount_of_movements do
      next_position = calc_next_position(movement_list[count], position, length_map_i, length_map_j, map)
      if next_position == position
        count = count + 1
      else
        position = next_position
      end
    end

    position

  end
end