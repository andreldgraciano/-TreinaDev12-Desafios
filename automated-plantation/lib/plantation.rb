class Plantation

  def initialize(instructions, plantation_size)
    @instructions = instructions
    @plantation_size = plantation_size
    @area = Array.new(@plantation_size[0].to_i) { Array.new(@plantation_size[0].to_i, " ") }
    @esperado = []
  end

  def set_crop()
    instrucoes = @instructions.split
    instrucoes.shift
    plantio = []

    instrucoes.each do |instrucao|
      if instrucao == '{*}'
        @esperado << instrucao
      elsif instrucao == '[+]'
        @esperado << instrucao
      else
        plantio << instrucao.split(":")
      end
    end

    plantio.each do |metodo|
      plantar = metodo[0]

      inicio = metodo[1].split(',')
      inicio = inicio.map(&:to_i)

      tamanho = metodo[2].split('x')
      tamanho = tamanho.map(&:to_i)

      tamanho[0] = @area.length if tamanho[0] > @area.length
      tamanho[1] = @area[0].length if tamanho[1] > @area[0].length

      for i in inicio[0]..inicio[0] + tamanho[0] - 1
        for j in inicio[1]..inicio[1] + tamanho[1] - 1
          if @area[i][j] == ' '
            @area[i][j] = plantar
          elsif plantar == '*' && @area[i][j] == '{}'
            @area[i][j] = '{*}'
          elsif plantar == '[]' && @area[i][j] == '*'
            @area[i][j] = '[*]'
          elsif plantar == '+' && @area[i][j] == '{}'
            @area[i][j] = '{+}'
          elsif plantar == '+' && @area[i][j] == '[]'
            @area[i][j] = '[+]'
          end
        end
      end
      
    end

    @area
  
  end

  def healthy_crop()
    contador = 0
    for k in 0..@esperado.length-1
      for i in 0..@area.length-1
        for j in 0..@area[i].length-1
          if @area[i][j] == @esperado[k]
            contador += 1
          end
        end
      end
    end
    contador
  end
  
end
