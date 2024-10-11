class Participant
  attr_accessor :starting_position, :previous_position, :movement_speed, :strength, :team

  def initialize(starting_position:, movement_speed:, strength:, team:)
    @starting_position = starting_position
    @previous_position = nil
    @movement_speed = movement_speed
    @strength = strength
    @team = team
  end
end

