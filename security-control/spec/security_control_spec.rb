require 'spec_helper'

describe 'SecurityControl' do
  it '1: Recebe arquivo contendo uma senha codificada e sua chave e escreve um arquivo com a senha decodificada' do
    File.open('data/result.txt', 'w') { |f| f.truncate(0) }
    decoder = SecurityControl.new.password_decoder('data/password_list1.txt')
    result = <<~VARIABLE.chomp
    turing
    VARIABLE

    expect(File.open('data/result.txt').read).to eq(result)
  end

  it '2: Recebe arquivo contendo uma senha codificada e sua chave e escreve um arquivo com a senha decodificada' do
    File.open('data/result.txt', 'w') { |f| f.truncate(0) }
    decoder = SecurityControl.new.password_decoder('data/password_list2.txt')
    result = <<~VARIABLE.chomp
    turing
    pai
    VARIABLE

    expect(File.open('data/result.txt').read).to eq(result)
  end

  it '3: Recebe arquivo contendo uma senha codificada e sua chave e escreve um arquivo com a senha decodificada' do
    File.open('data/result.txt', 'w') { |f| f.truncate(0) }
    decoder = SecurityControl.new.password_decoder('data/password_list3.txt')
    result = <<~VARIABLE.chomp
    %¨{}*$
    VARIABLE

    expect(File.open('data/result.txt').read).to eq(result)
  end

  it '4: Recebe arquivo contendo uma senha codificada e sua chave e escreve um arquivo com a senha decodificada' do
    File.open('data/result.txt', 'w') { |f| f.truncate(0) }
    decoder = SecurityControl.new.password_decoder('data/password_list4.txt')
    result = <<~VARIABLE.chomp
    p4i-da_
    c0mputaç4o
    VARIABLE

    expect(File.open('data/result.txt').read).to eq(result)
  end

  it '5: Recebe arquivo contendo uma senha codificada e sua chave e escreve um arquivo com a senha decodificada' do
    File.open('data/result.txt', 'w') { |f| f.truncate(0) }
    decoder = SecurityControl.new.password_decoder('data/password_list5.txt')
    result = <<~VARIABLE.chomp
    g4to-branc0
    sou-3l1te
    h4k3rs
    sou-51gma
    sig1l0zo
    VARIABLE

    expect(File.open('data/result.txt').read).to eq(result)
  end
end