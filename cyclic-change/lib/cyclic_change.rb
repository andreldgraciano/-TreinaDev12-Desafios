class CyclicChange
  def in_matrix?(row_index, column_index, x, y, num_rows, num_column)
    in_rows = (row_index + x).between?(0, num_rows - 1)
    in_column = (column_index + y).between?(0, num_column - 1)
    
    return in_rows && in_column
  end

  def cycle(table, cycles)
    @table = table
    @cycles = cycles
    @array_test = [
      [-1,-1],
      [-1,0],
      [-1,1],
      [0,1],
      [1,1],
      [1,0],
      [1,-1],
      [0,-1]
    ]
    @num_rows = @table.size
    @num_column = @table[0].size

    for i in 0..@cycles - 1
      
      table_cpy = Marshal.load(Marshal.dump(@table))
      
      @table.each_with_index do |row, row_index|
        row.each_with_index do |element, column_index|
          count_bar = 0
          count_hyphen = 0

          if element != '+'
            @array_test.each do |x, y|
              if in_matrix?(row_index, column_index, x, y, @num_rows, @num_column)
                if @table[row_index + x][column_index + y] == '|'
                  count_bar += 1
                elsif @table[row_index + x][column_index + y] == '-'
                  count_hyphen += 1
                else
                  count_bar +=1
                  count_hyphen +=1
                end
              end
            end
          end

          table_cpy[row_index][column_index] = '+' if count_bar >= 4 && count_hyphen >= 4
        end
      end

      @table = Marshal.load(Marshal.dump(table_cpy))
    end

    @table 
  end
end
