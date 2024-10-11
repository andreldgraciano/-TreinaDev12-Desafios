class MemoryManager
  def enqueue(memory)
    matrix = []
    string = ''
    
    rows_memory = memory.split("\n")

    count_queues = rows_memory.size
    array_queues = Array.new(count_queues) { |index| [[], 0] }

    rows_memory.each do |row|
      elements = row.split
      elements.map! do |element|
        value, time = element.split(":")
        { value: value, time: time }
      end
      matrix << elements
    end
    
    matrix = matrix.transpose
    
    matrix.each_with_index do |row, index_rows|
      row.each_with_index do |work, index_columns|
        index_row_lower_value, lower_value = nil, nil
        index_row_highest_value, highest_value = nil, nil
        
        array_queues.each_with_index do |element, index|
          value = element[1]
          
          if lower_value.nil? || value < lower_value
            lower_value = value
            index_row_lower_value = index
          end
          
          if highest_value.nil? || value > highest_value
            highest_value = value
            index_row_highest_value = index
          end
        end

        array_queues[index_row_lower_value][0] << work[:value]
        array_queues[index_row_lower_value][1] += work[:time].to_i
      end
    end

    string = array_queues.map { |row| row[0].join(' ') }.join("\n")
  end
end