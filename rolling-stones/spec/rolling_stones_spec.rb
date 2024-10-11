require 'spec_helper'

describe 'RollingStone' do
  it '1: Recebe mapa, posição inicial e lista de movimentos, e retorna posição final da pedra' do
    map = [['O','O','O'],
           ['O','O','O'],
           ['O','O','O']]
    position = [1,2]
    movement_list = 'ED'

    expect(RollingStone.new.movement(map, position, movement_list)).to eq([1,2])
  end

  it '2: Recebe mapa, posição inicial e lista de movimentos, e retorna posição final da pedra' do
    map = [['O','O','O'],
           ['O','O','O'],
           ['O','O','O']]
    position = [2,2]
    movement_list = 'EDBC'

    expect(RollingStone.new.movement(map, position, movement_list)).to eq([0,2])
  end

  it '3: Recebe mapa, posição inicial e lista de movimentos, e retorna posição final da pedra' do
    map = [['O','O','O','O'],
           ['O','O','O','O'],
           ['O','O','O','O'],
           ['O','O','O','O']]
    position = [1,3]
    movement_list = 'BCBCC'

    expect(RollingStone.new.movement(map, position, movement_list)).to eq([0,3])
  end

  it '4: Recebe mapa com obstáculos, posição inicial e lista de movimentos, e retorna posição final da pedra' do
    map = [['O','X','O','O'],
           ['O','O','O','X'],
           ['X','O','O','O'],
           ['O','O','X','O']]
    position = [0,0]
    movement_list = 'DCEBDCE'

    expect(RollingStone.new.movement(map, position, movement_list)).to eq([0,2])
  end

  it '5: Recebe mapa com obstáculos, posição inicial e lista de movimentos, e retorna posição final da pedra' do
    map = [['O','X','O','O'],
           ['X','O','X','X'],
           ['X','X','O','O'],
           ['O','O','X','O']]
    position = [1,1]
    movement_list = 'BEDBCDE'

    expect(RollingStone.new.movement(map, position, movement_list)).to eq([1,1])
  end

  it '6: Recebe mapa com obstáculos, posição inicial e lista de movimentos, e retorna posição final da pedra' do
    map = [['O','X','O','X','X'],
           ['O','O','O','X','O'],
           ['X','O','O','O','O'],
           ['O','X','X','O','O'],
           ['O','O','O','O','O']]
    position = [4,0]
    movement_list = 'CDCBDCEC'

    expect(RollingStone.new.movement(map, position, movement_list)).to eq([1,4])
  end

  it '7: Recebe mapa com obstáculos, posição inicial e lista de movimentos, e retorna posição final da pedra' do
    map = [['O','X','O','X','O','O'],
           ['O','O','O','O','O','X'],
           ['X','X','O','O','O','O'],
           ['O','X','X','O','O','X'],
           ['O','O','O','O','O','O']]
    position = [0,5]
    movement_list = 'BEBDCECDC'

    expect(RollingStone.new.movement(map, position, movement_list)).to eq([3,0])
  end
end
