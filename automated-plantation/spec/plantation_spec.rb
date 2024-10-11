require 'spec_helper'

describe Plantation do
  it '1.Planta sementes de acordo com instruções' do
    plantation_size = '2x2'
    instructions = <<~INSTRUCTIONS
    fertilizante/semente {*}
    *:0,0:1x2
    INSTRUCTIONS
    plantation_map = [["*", "*",],
                      [" ", " ",]]

    plantation = Plantation.new(instructions, plantation_size)

    expect(plantation.set_crop).to eq plantation_map
    expect(plantation.healthy_crop).to eq 0
  end

  it '2.Planta sementes de acordo com instruções' do
    plantation_size = '3x3'
    instructions = <<~INSTRUCTIONS
    fertilizante/semente {*}
    *:0,0:2x2
    INSTRUCTIONS
    plantation_map = [["*", "*", " "],
                      ["*", "*", " "],
                      [" ", " ", " "]]

    plantation = Plantation.new(instructions, plantation_size)

    expect(plantation.set_crop).to eq plantation_map
    expect(plantation.healthy_crop).to eq 0
  end

  it '3.Planta sementes de acordo com instruções dentro e fora do terreno' do
    plantation_size = '3x3'
    instructions = <<~INSTRUCTIONS
    fertilizante/semente {*}
    *:0,0:4x4
    INSTRUCTIONS
    plantation_map = [["*", "*", "*"],
                      ["*", "*", "*"],
                      ["*", "*", "*"]]

    plantation = Plantation.new(instructions, plantation_size)


    expect(plantation.set_crop).to eq plantation_map
    expect(plantation.healthy_crop).to eq 0
  end

  it '4.Fertiliza solo de acordo com instruções dentro e fora do terreno' do
    plantation_size = '3x3'
    instructions = <<~INSTRUCTIONS
    fertilizante/semente {*}
    {}:1,1:2x2
    INSTRUCTIONS
    plantation_map = [[" ",  " ",  " "],
                      [" ", "{}", "{}"],
                      [" ", "{}", "{}"]]

    plantation = Plantation.new(instructions, plantation_size)

    expect(plantation.set_crop).to eq plantation_map
    expect(plantation.healthy_crop).to eq 0
  end

  it '5.Planta e fertiliza sementes, com rendimento 4' do
    plantation_size = '3x3'
    instructions = <<~INSTRUCTIONS
    fertilizante/semente {*}
    {}:0,0:2x2
    *:0,0:2x2
    INSTRUCTIONS
    plantation_map = [["{*}", "{*}", " "],
                      ["{*}", "{*}", " "],
                      [" ",   " ",   " "]]

    plantation = Plantation.new(instructions, plantation_size)

    expect(plantation.set_crop).to eq plantation_map
    expect(plantation.healthy_crop).to eq 4
  end

  it '6.Planta e fertiliza sementes, com rendimento 1' do
    plantation_size = '3x3'
    instructions = <<~INSTRUCTIONS
    fertilizante/semente {*}
    {}:0,0:2x2
    *:1,1:2x2
    INSTRUCTIONS
    plantation_map = [["{}", "{}", " "],
                      ["{}", "{*}","*"],
                      [" ",   "*", "*"]]

    plantation = Plantation.new(instructions, plantation_size)

    expect(plantation.set_crop).to eq plantation_map
    expect(plantation.healthy_crop).to eq 1
  end

  it '7.Planta e fertiliza sementes, com rendimento 1' do
    plantation_size = '3x3'
    instructions = <<~INSTRUCTIONS
    fertilizante/semente {*} [+]
    {}:0,0:2x2
    *:1,1:2x2
    +:2,0:1x1
    []:0,2:1x1
    INSTRUCTIONS
    plantation_map = [["{}", "{}", "[]"],
                      ["{}", "{*}", "*"],
                      ["+",  "*",   "*"]]

    plantation = Plantation.new(instructions, plantation_size)

    expect(plantation.set_crop).to eq plantation_map
    expect(plantation.healthy_crop).to eq 1
  end

  it '8.Planta e fertiliza sementes, com rendimento 16' do
    plantation_size = '6x6'
    instructions = <<~INSTRUCTIONS
    fertilizante/semente {*} [+]
    {}:1,0:5x4
    *:0,1:6x2
    []:0,2:5x4
    +:2,3:4x3
    INSTRUCTIONS
    plantation_map = [[" ",  "*",   "[*]", "[]",  "[]",  "[]"],
                      ["{}", "{*}", "{*}", "{}",  "[]",  "[]"],
                      ["{}", "{*}", "{*}", "{+}", "[+]", "[+]"],
                      ["{}", "{*}", "{*}", "{+}", "[+]", "[+]"],
                      ["{}", "{*}", "{*}", "{+}", "[+]", "[+]"],
                      ["{}", "{*}", "{*}", "{+}", "+",   "+"]]

    plantation = Plantation.new(instructions, plantation_size)

    expect(plantation.set_crop).to eq plantation_map
    expect(plantation.healthy_crop).to eq 16
  end
end
