require 'spec_helper'

describe 'CyclicChange' do
  it '1. Verifica padrão de espalhamento em 3x3 após 1 ciclo' do
    table = [
             ['|', '-', '|'],
             ['|', '-', '-'],
             ['|', '-', '|']
            ]
    result = [
              ['|', '-', '|'],
              ['|', '-', '-'],
              ['|', '-', '|']
             ]
    cycles = 1

    expect(CyclicChange.new.cycle(table, cycles)).to eq result
  end

  it '2. Verifica padrão de espalhamento em 3x3 após 1 ciclo' do
    table = [
             ['|', '-', '|'],
             ['-', '-', '-'],
             ['|', '-', '|']
            ]
    result = [
              ['|', '-', '|'],
              ['-', '+', '-'],
              ['|', '-', '|']
             ]
    cycles = 1

    expect(CyclicChange.new.cycle(table, cycles)).to eq result
  end

  it '3. Verifica padrão de espalhamento em 3x3 após 2 ciclo' do
    table = [
             ['|', '+', '|'],
             ['+', '+', '-'],
             ['|', '+', '-']
            ]
    result = [
              ['|', '+', '|'],
              ['+', '+', '+'],
              ['|', '+', '-']
             ]
    cycles = 2

    expect(CyclicChange.new.cycle(table, cycles)).to eq result
  end

  it '4. Verifica padrão de espalhamento em 5x5 após 2 ciclos' do
    table = [
             ['|', '-', '|', '-', '|'],
             ['-', '|', '-', '-', '|'],
             ['|', '|', '-', '|', '-'],
             ['-', '-', '|', '-', '|'],
             ['|', '-', '-', '|', '-']
            ]

    result = [
              ["|", "-", "|", "-", "|"],
              ["-", "+", "+", "+", "|"],
              ["|", "+", "+", "+", "-"],
              ["-", "+", "+", "+", "|"],
              ["|", "-", "-", "|", "-"]
            ]
    cycles = 2

    expect(CyclicChange.new.cycle(table, cycles)).to eq result
  end

  it '5. Verifica padrão de espalhamento em 3x5 após 3 ciclos' do
    table = [
             ['+', '-', '-'],
             ['+', '|', '+'],
             ['|', '|', '+'],
             ['-', '-', '-'],
             ['|', '-', '|']
            ]

    result = [
              ["+", "+", "-"],
              ["+", "+", "+"],
              ["+", "+", "+"],
              ["+", "+", "+"],
              ["|", "-", "|"]
            ]
    cycles = 3

    expect(CyclicChange.new.cycle(table, cycles)).to eq result
  end

  it '6. Verifica padrão de espalhamento em 4x6 após 4 ciclos' do
    table = [
             ['+', '-', '-', '+', '|', '+'],
             ['+', '|', '+', '|', '+', '-'],
             ['|', '|', '+', '-', '-', '-'],
             ['-', '-', '-', '|', '|', '-'],
             ['|', '-', '|', '+', '-', '|']
            ]

    result = [
              ["+", "+", "+", "+", "+", "+"],
              ["+", "+", "+", "+", "+", "+"],
              ["+", "+", "+", "+", "+", "+"],
              ["+", "+", "+", "+", "+", "+"],
              ["|", "+", "+", "+", "+", "|"]
            ]
    cycles = 4

    expect(CyclicChange.new.cycle(table, cycles)).to eq result
  end


  it '7. Verifica padrão de espalhamento em 7x7 após 3 ciclos' do
    table = [
             ['|', '-', '|', '-', '|', '-', '|'],
             ['-', '|', '-', '-', '|', '-', '|'],
             ['|', '|', '-', '|', '-', '-', '-'],
             ['-', '-', '|', '-', '|', '|', '|'],
             ['|', '-', '-', '|', '-', '|', '|'],
             ['-', '|', '|', '+', '-', '|', '-'],
             ['|', '+', '-', '|', '-', '|', '-']
            ]

    result = [
              ["|", "-", "|", "-", "|", "-", "|"],
              ["-", "+", "+", "+", "+", "+", "|"],
              ["|", "+", "+", "+", "+", "+", "-"],
              ["-", "+", "+", "+", "+", "+", "+"],
              ["|", "+", "+", "+", "+", "+", "|"],
              ["-", "+", "+", "+", "+", "+", "-"], 
              ["|", "+", "+", "+", "-", "|", "-"]
             ]
    cycles = 3

    expect(CyclicChange.new.cycle(table, cycles)).to eq result
  end
end
