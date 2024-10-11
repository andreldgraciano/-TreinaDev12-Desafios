require 'spec_helper'

describe 'JuninhoExam' do
  it '1. Recebe o mapa e os participantes e determina quem passa no exame' do
    map = [['X','X','*'],
           ['*','!','*'],
           ['*','X','X'],
           ['*','X','X']]

    participants = [Participant.new(starting_position: [0,2], movement_speed: 1,
                                    strength: 1, team: 'Geninhos da Folha'),
                    Participant.new(starting_position: [3,0], movement_speed: 1,
                                    strength: 1, team: 'Seninhos da Folha')]

    expect(JuninhoExam.new(map: map, participants: participants).winner).to eq('Geninhos da Folha')
  end

  it '2. Recebe o mapa e os participantes e determina quem passa no exame' do
    map = [['X','X','*','*'],
           ['*','!','*','X'],
           ['*','X','X','X'],
           ['*','*','X','X']]

    participants = [Participant.new(starting_position: [0,3], movement_speed: 1,
                                    strength: 1, team: 'Geninhos da Folha'),
                    Participant.new(starting_position: [3,1], movement_speed: 2,
                                    strength: 1, team: 'Seninhos da Folha')]

    expect(JuninhoExam.new(map: map, participants: participants).winner).to eq('Seninhos da Folha')
  end

  it '3. Recebe o mapa e os participantes e determina quem passa no exame' do
    map = [['X','X','X','X'],
           ['*','!','*','X'],
           ['*','X','*','*'],
           ['*','X','X','X']]

    participants = [Participant.new(starting_position: [2,3], movement_speed: 1,
                                    strength: 1, team: 'Geninhos da Folha'),
                    Participant.new(starting_position: [3,0], movement_speed: 1,
                                    strength: 3, team: 'Seninhos da Folha')]

    expect(JuninhoExam.new(map: map, participants: participants).winner).to eq('Seninhos da Folha')
  end

  it '4. Recebe o mapa e os participantes e determina quem passa no exame' do
    map = [['*','X','X','*','*','*','*'],
           ['*','X','X','*','X','X','X'],
           ['*','X','X','*','X','X','X'],
           ['*','*','*','!','X','X','X'],
           ['X','X','X','*','X','X','X'],
           ['X','X','*','*','X','X','X'],
           ['X','X','*','X','*','*','*'],
           ['X','X','*','*','*','X','*']]

    participants = [Participant.new(starting_position: [0,0], movement_speed: 1,
                                    strength: 1, team: 'Geninhos da Folha'),
                    Participant.new(starting_position: [0,6], movement_speed: 1,
                                    strength: 3, team: 'Seninhos da Folha'),
                    Participant.new(starting_position: [7,6], movement_speed: 1,
                                    strength: 3, team: 'Geninhos da Folha')]

    expect(JuninhoExam.new(map: map, participants: participants).winner).to eq('Seninhos da Folha')
  end

  it '5. Recebe o mapa e os participantes e determina quem passa no exame' do
    map = [['X','X','X','*','*'],
           ['X','X','X','*','X'],
           ['X','X','X','*','X'],
           ['*','*','*','!','X'],
           ['*','X','X','*','X'],
           ['*','X','X','*','X'],
           ['*','X','*','*','X'],
           ['X','X','X','X','X']]

    participants = [Participant.new(starting_position: [6,2], movement_speed: 2,
                                    strength: 1, team: 'Geninhos da Folha'),
                    Participant.new(starting_position: [0,4], movement_speed: 2,
                                    strength: 3, team: 'Seninhos da Folha'),
                    Participant.new(starting_position: [6,0], movement_speed: 3,
                                    strength: 3, team: 'Geninhos da Folha')]

    expect(JuninhoExam.new(map: map, participants: participants).winner).to eq('Geninhos da Folha')
  end

  it '6. Recebe o mapa e os participantes e determina quem passa no exame' do
    map = [['X','X','X','*','*','X','X','X','X','X','X'],
           ['X','X','X','X','*','X','X','X','X','X','X'],
           ['*','*','X','X','*','X','X','X','X','X','X'],
           ['*','X','X','*','*','X','X','X','X','X','X'],
           ['*','X','X','*','X','X','X','X','X','X','X'],
           ['*','X','X','*','X','X','X','X','X','X','*'],
           ['*','*','X','*','X','X','X','X','X','X','*'],
           ['X','*','*','!','*','*','*','*','*','*','*'],
           ['X','X','X','*','X','X','X','X','X','X','X'],
           ['X','X','X','*','X','*','X','X','X','X','X'],
           ['X','X','X','*','*','*','X','X','X','X','X']]

    participants = [Participant.new(starting_position: [0,3], movement_speed: 3,
                                    strength: 1, team: 'Geninhos da Folha'),
                    Participant.new(starting_position: [5,10], movement_speed: 3,
                                    strength: 3, team: 'Seninhos da Folha'),
                    Participant.new(starting_position: [9,5], movement_speed: 2,
                                    strength: 3, team: 'Geninhos da Folha'),
                    Participant.new(starting_position: [2,1], movement_speed: 3,
                                    strength: 3, team: 'Seninhos da Folha')]

    expect(JuninhoExam.new(map: map, participants: participants).winner).to eq('Seninhos da Folha')
  end
end
