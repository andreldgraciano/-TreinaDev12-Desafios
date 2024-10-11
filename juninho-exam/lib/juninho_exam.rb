class JuninhoExam
  attr_accessor :map, :participants

  def initialize(map:, participants:)
    @map = map
    @participants = participants
    @num_rows = @map.size
    @num_column = @map[0].size
  end

  def in_matrix?(row_index, column_index, x, y, num_rows, num_column, previous_position)    
    in_rows = (row_index + x).between?(0, num_rows - 1)
    in_column = (column_index + y).between?(0, num_column - 1)
    next_position = [row_index + x, column_index + y]
    previous = next_position != previous_position

    return in_rows && in_column && previous
  end

  def winner
    @winner = []
    @array_test = [
      [-1,0],
      [0,1],
      [1,0],
      [0,-1]
    ]
    has_winner = false

    while has_winner == false

      @participants.each do |participant|

        for i in 1..participant.movement_speed

          @array_test.each do |x, y|

            if in_matrix?(participant.starting_position[0], participant.starting_position[1], x, y, @num_rows, @num_column, participant.previous_position)

              if @map[participant.starting_position[0] + x][participant.starting_position[1] + y] == '*'
                participant.previous_position = participant.starting_position
                participant.starting_position = [participant.starting_position[0] + x, participant.starting_position[1] + y]
                break

              elsif @map[participant.starting_position[0] + x][participant.starting_position[1] + y] == '!'
                participant.previous_position = participant.starting_position
                participant.starting_position = [participant.starting_position[0] + x, participant.starting_position[1] + y]
                @winner << participant
                break
              end

            end

            if participant.starting_position ==  '!'
              break
            end

          end
        end
      end

      if !@winner.empty?
        has_winner = true
      end
    end

    team_strength = Hash.new(0)

    @winner.each do |participant|
      team_strength[participant.team] += participant.strength
    end

    team_winner = team_strength.max_by { |team, strength| strength }[0]
  end
end