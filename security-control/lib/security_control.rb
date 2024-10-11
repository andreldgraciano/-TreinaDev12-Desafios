class SecurityControl
  def read_passwords(input_file)
    split_passwords = []

    File.foreach(input_file) do |row|
      parts = row.chomp.split(' ')
      password = parts[0..-2].join('')
  
      division_size = parts.last.to_i
      split_password = []
  
      password.chars.each_slice(division_size) { |slice| split_password << slice.join('') }
  
      split_passwords << [split_password, division_size]
    end

    split_passwords
  end


  def password_decoder(input_file)
    response_array = []
    split_passwords = read_passwords(input_file)
    split_passwords.each_with_index do |password, index_response_array|
      size_seq = password[1]
      password = password[0]
      response_array[index_response_array] = []
      password.each do |seq|
        if response_array[index_response_array].empty?
          seq.each_char do |char|
            response_array[index_response_array] << char
          end
        else
          chars_seq = [].fill('', 0, size_seq)
          index = 0
          seq.each_char do |char|
            chars_seq[index] = char
            index += 1
          end
          
          for i in 0..size_seq-1
            if !response_array[index_response_array].include?(chars_seq[i])
              if i-1 >= 0
                index_char = response_array[index_response_array].index(chars_seq[i-1]) + 1
                response_array[index_response_array].insert(index_char, chars_seq[i])
              elsif chars_seq[i+1] != nil

                if response_array[index_response_array].index(chars_seq[i+1]) == nil
                  index_char = response_array[index_response_array].index(chars_seq[i+2])
                  response_array[index_response_array].insert(index_char, chars_seq[i+1])

                  index_char = response_array[index_response_array].index(chars_seq[i+1]) - 1
                  response_array[index_response_array].insert(index_char, chars_seq[i])
                else
                  index_char = response_array[index_response_array].index(chars_seq[i+1]) - 1
                  response_array[index_response_array].insert(index_char, chars_seq[i])
                end
              end
            end
          end

          for i in 0..size_seq-2
            if !(response_array[index_response_array].index(chars_seq[i]) < response_array[index_response_array].index(chars_seq[i+1]))
              response_array[index_response_array].delete(chars_seq[i])
              index = response_array[index_response_array].index(chars_seq[i+1])
              response_array[index_response_array].insert(index, chars_seq[i])
            end
          end
        end
      end
    end
    string = response_array.map(&:join).join("\n")
    File.open("data/result.txt", "w") do |file|
      file.write(string)
    end
  end
end