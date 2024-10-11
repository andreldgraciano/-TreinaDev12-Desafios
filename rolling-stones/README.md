# Rolando Pedras

Rolando Pedras é uma famosa revista musical que trata de um dos gêneros mais escutados dos anos 80: o Pedra. Essa revista é bastante famosa e tem muito interesse em conhecer seu vasto público de amantes de Pedra. Para isso, começou a colocar puzzles simples em seus exemplares para não só entreter seus compradores como também permitir que quem acertasse a resposta do puzzle pudesse concorrer a sorteios para conhecer a equipe criadora da revista. O puzzle é o seguinte:

Você receberá um mapa que contém uma bola de pedra que deverá rolar por ele. Esse mapa possui caminhos livres (representados por `'O'`) e obstáculos (representados por `'X'`), que interrompem a passagem livre da pedra. Vejo um exemplo de mapa a seguir:

```
[['O','X','O','O'],
 ['O','O','O','X'],
 ['X','O','O','O'],
 ['O','O','X','O']]
```

Nesse mapa, temos 4 obstáculos representados. Se uma pedra estiver rolando em direção a um obstáculo, ela irá parar assim que encostar nele. Por exemplo, uma pedra na posição [0,3], se movendo a esquerda, se moverá livremente por [0,2] mas não conseguirá passar dessa coordenada, pois [0,1] é um obstáculo.

Além do mapa, você também receberá uma lista de instruções que representam movimentos tomados pela pedra no mapa. Essa lista de instruções dita os movimentos que a pedra deve fazer pelo mapa. Nas instruções há quatro movimentos possíveis:

  - 'E' - Essa instrução dita que a pedra deve rolar o máximo possível para a esquerda;
  - 'D' - Essa instrução dita que a pedra deve rolar o máximo possível para a direita;
  - 'C' - Essa instrução dita que a pedra deve rolar o máximo possível para cima;
  - 'B' - Essa instrução dita que a pedra deve rolar o máximo possível para baixo;

Nesse desafio, você deverá escrever o algoritmo que resolve o puzzle acima, recebendo o array `map` que representa o mapa onde a pedra deverá rolar, a string `movement_list`, que dita os movimentos que devem ser feitos pela pedra e o array `position`, que representa a posição inicial da pedra e retorna a posição final da pedra depois de todos os movimentos.