require 'spec_helper'

describe PokerGame do
  it '1.Analisa jogos e vence Gaga com Carta' do
    hands = <<~POKERGAMES
      Gaga: 3PQCAC8O10E
    POKERGAMES

    resultado = ['Gaga: Carta']

    expect(PokerGame.new(hands).play).to eq resultado
  end

  it '2.Analisa jogos e vence Lady com Par' do
    hands = <<~POKERGAMES
      Lady: 3P3CAC8O10E
      Gaga: 2OJC4E5O6O
    POKERGAMES

    resultado = ['Lady: Par', 'Gaga: Carta']

    expect(PokerGame.new(hands).play).to eq resultado
  end

  it '3.Analisa jogos e vence Otávio com Sequência de mesmo naipe' do
    hands = <<~POKERGAMES
      André: 3P8O3CAC10E
      Otávio: 6O2O3O4O5O
    POKERGAMES

    resultado = ['Otávio: Sequência de mesmo naipe', 'André: Par']

    expect(PokerGame.new(hands).play).to eq resultado
  end

  it '4.Analisa jogos e vence Gabriel com Sequência de mesmo naipe' do
    hands = <<~POKERGAMES
      André: 5EAP2C3C4O
      Gabriel: 7C6C5C8C9C
    POKERGAMES

    resultado = ['Gabriel: Sequência de mesmo naipe' , 'André: Sequência']

    expect(PokerGame.new(hands).play).to eq resultado
  end

  it '5.Analisa jogos e vence Cláudia com Quadra' do
    hands = <<~POKERGAMES
      Erika: 8O9C9E8C9O
      Otávio: 10O3CJC10E3O
      Cláudia: 5O5CQC5E5P
    POKERGAMES

    resultado = ['Cláudia: Quadra', 'Erika: Fullhouse' , 'Otávio: Dois Pares']

    expect(PokerGame.new(hands).play).to eq resultado
  end

  it '6.Analisa jogos e vence Erika com Flush' do
    hands = <<~POKERGAMES
      Erika: AE7E10E9EJE
      Otávio: 5P3E5EQC5C
      Cláudia: KE2E10C2PAC
      Gabriel: 3CKOKC3OJC
      André: 2CKPAPQE10E
    POKERGAMES

    resultado = ['Erika: Flush', 'Otávio: Trio', 'Gabriel: Dois Pares',
                 'Cláudia: Par', 'André: Carta']

    expect(PokerGame.new(hands).play).to eq resultado
  end
end
