# Desafios Exclusivos TreinaDev 12

## Tabela de Conteúdo

- [Plantação Automatizada](#plantação-automatizada)
- [Mudanças Cíclicas](#mudanças-cíclicas)
- [Jogos de Pôquer](#jogos-de-pôquer)
- [Exame Juninho](#exame-juninho)
- [Jirbes, o Gerente de Memória](#jirbes,-o-gerente-de-memória)
- [Loja de poções](#loja-de-poções)
- [Rolando Pedras](#rolando-pedras)
- [Controle de Segurança](#controle-de-segurança)

# Plantação Automatizada

Para agilizar o plantio, um fazendeiro começou a usar máquinas para plantar sementes e fertilizá-las em áreas
específicas de uma plantação de tamanho definido.

As instruções que as máquinas recebem contam com o tipo de semente ou
fertilizante, o ponto inicial de onde a máquina deve iniciar, seguido da
quantidade de linhas e colunas que devem ser preparados. Exemplo:

```
fertilizante/semente {*}
*:0,0:2x2
{}:1,1:2x2
```

As instruções começam com o tipo de combinação entre semente `*` e fertilizante `{ }`
que deveria ser entregue, neste caso `{*}`.
Cada instrução começa com um fertilizante ou semente, seguido pela posição inicial para
fertilização `0,0` e a quantidade de linhas e colunas `2x2` (a partir da posição inicial,
para a direita e para baixo). Para esse exemplo,
considerando uma plantação de tamanho `3x3` teríamos:

```
[["*", "*", " "],
 ["*", "*", " "],
 [" ", " ", " "]]
```

Depois de executar a instrução, a plantação teria 4 pontos com sementes
plantadas. Os pontos que não receberem sementes ou fertilizantes ficam com
espaços em branco.

Continuando a execução das instruções, o fertiizante `{}` é aplicado, resultando
no seguinte:

```
[["*", "*"  , " "],
 ["*", "{*}", "{}"],
 [" ", "{}" , "{}"]]
```

Nesta plantação, após a execução das instruções, apenas um ponto foi plantado e
fertilizado de acordo com a combinação esperada `{*}`.

No desafio, você deve implementar o código que recebe as instruções e o tamanho
da plantação, com o método `set_crop`, que retorna o mapa de como ficou a
plantação, e o método `healthy_crop`, que retorna quantos pontos foram plantados
e fertilizados com a combinação esperada.

# Mudanças Cíclicas

Assuma uma matriz de dados na qual cada célula pode conter 3 tipos de marcações: `-`, `|` e `+`. Por exemplo:

```
[
 ['|', '+', '|'],
 ['+', '+', '-'],
 ['|', '+', '-']
]
```

Seguindo as regras de espalhamento:

- Se uma célula tiver, ao seu redor, 4 células marcadas como '-' e 4 células marcadas como '|',
sua marcação deve ser trocada para '+';
- Se uma célula possui o marcador '+', ela conta tanto como uma célula com marcador '-' como
quanto uma célula com marcador '|';

A cada ciclo de espalhamento, cada célula sofre alteração conforme as regras
acima. A matriz do exemplo ficaria assim após um ciclo de espalhamento:

```
[
 ['|', '+', '|'],
 ['+', '+', '+'],
 ['|', '+', '-']
]
```

E, após um segundo ciclo, neste caso, a matriz permaneceria exatamente da mesma forma, pois nenhuma
célula atende aos requisitos de mudança descrito nas regras.

Neste desafio você deve implementar o código que recebe uma matriz inicial `table` e uma
quantidade de ciclos `cycles` que devem ser aplicados. Ao final, o código deve retornar a
matriz modificada conforme as regras após aplicação dos ciclos de espalhamento.

# Jogos de Pôquer

Neste desafio, você deve implementar um algoritmo que seja capaz de analisar mãos
de jogos de pôquer de 5 cartas e determinar a ordem de valor das mãos
das pessoas que estão jogando, de acordo com a classificação de combinações de cartas.

Os naipes serão representados pelas letras P (Paus), O (Ouros), C (Copas),
E (Espadas). As mãos serão representadas por strings de letras e números, por
exemplo:

```
AE7P4O10CAC

AE: ás de Espadas
7P: sete de Paus
4O: quatro de Ouros
10C: dez de Copas
AC: ás de Copas
```

No exemplo acima, a mão possui dois ases. As demais cartas não
representam combinação nenhuma.

Considere as combinações válidas abaixo:

```
# Rank de Combinações, da mais baixa para a mais alta

'Carta' 8C3C7EKOAP
'Par' ACAE7P4O10C
'Dois Pares' ACAE7P7O10C
'Trio' ACAEAP7O10C
'Sequência' AE2P3O4E5C
'Flush' AEJE4E7E10E
'Fullhouse' AEAOACJEJC
'Quadra' ACAEAPAO10C
'Sequência de mesmo naipe' 4E5E6E7E8E
```

Você pode considerar, neste desafio, que não ocorrerão empates e que a sequência
ordenada das cartas é a seguinte:

```
 ['A', '2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K']
```

Os jogos serão apresentados com strings no seguinte formato:

```ruby
Paula: 3P3CAC8O10E
Felipe: 2OJC4E5O6O
Otávio: 6P2P3P4P5P
```

No exemplo acima, Paula possui um Par, Felipe apenas uma Carta e Otávio
possui uma Sequência de mesmo naipe. Logo o retorno do código deve ser:

```ruby
['Otávio: Sequência de mesmo naipe', 'Paula: Par', 'Felipe: Carta']
```

# Exame Juninho

De 4 em quatro anos, na Aldeia da Folha, é realizado o Exame Juninho. Nesse exame, diferentes times competem entre si pela chance de um de seus membros se tornar o Pagé da Aldeia da Folha pelos próximos 4 anos. A fase em time desse exame consiste em uma trilha por um labirinto, onde os competidores devem chegar a um ponto específico marcado no labirinto. Para um time ser declarado vencedor nessa fase, pelo menos um de seus membros deve ser o primeiro a chegar ao ponto marcado. Na ocasião em que membros de times rivais chegam ao mesmo tempo no objetivo, eles devem lutar, com o vencedor dessa luta garantindo a vitória da fase para seu time.

Nesse desafio, você deverá fazer o código que acompanha essa fase do Exame Juninho. Seu código receberá:

- O array `map`, que contém o layout do labirinto onde a fase acontecerá. Esse array possui 3 marcações:
  - `X`: campos marcados com esse símbolo sinalizam paredes do labirinto pelas quais os competidores não podem passar;
  - `*`: campos marcados com esse símbolo sinalizam caminhos livres do labirinto. Cada competidor terá apenas um caminho possível até o ponto marcado;
  - `!`: o campo marcado com esse símbolo sinaliza o objetivo.

- O array `participants` que contém as informações de cada participante competindo na fase. Essas informações incluem:
  - `starting_position`: posição inicial do participante no labirinto;
  - `movement_speed`: número inteiro que representa quantas posições no labirinto o participante consegue percorrer por ciclo.

Considere que um ciclo termina quando **todos** os participantes do exame terminam de se mover o número de casas representado por essa velocidade, e que todos os participantes terminam o movimento de um ciclo ao mesmo tempo;
  - `strength`: força do participante. Caso dois participantes de times rivais se encontrem no objetivo, o participante com a maior força vence;
  - `team`: time ao qual aquele participante pertence. Na ocasião onde duas ou mais pessoas de um time chegam ao mesmo tempo no objetivo junto com um participante rival, as forças de participantes do mesmo time devem ser somadas e tratadas como uma só para lutar contra o time rival. Ou seja, se os participantes A, B e C chegam no objetivo, com A e B em um time e C em outro time, trate a força de A e B como a somatória das duas. Dessa forma, a comparação para ver qual time vence seria entre a força de A + B contra a força de C.

Com essas informações, seu código deve retornar qual o time vencedor ao final dessa etapa do exame.

# Jirbes, o Gerente de Memória

Jirbes é o gnomo gerente de memória dentro de um computador. Ele é responsável
por gerenciar o enfileiramento de tarefas nos núcleos de processamento
computacionais.

Jirbes recebe listas de tarefas em um núcleo e deve organizar o enfileiramento
dessas tarefas no outro núcleo, que possui a mesma quantidade de filas
disponíveis. Cada tarefa tem seu código de identificação e o tempo que demora
para ser concluída. No exemplo abaixo, o núcleo possui duas filas
representadas por cada linha. Cada fila possui 3 tarefas.

```
A123:50 A456:20 A789:30
B123:10 B456:10 B789:120
```

Na primeira fila, a tarefa A123 demora 50 unidades de tempo para ser concluída e
a tarefa B123, demora 10.

O papel de Jirbes, como gerente de memória, é reorganizar as filas de tarefas em
outro núcleo, com mesma quantidade de filas, otimizando o tempo de execução das
tarefas.

Considerando o exemplo acima, a primeira tarefa que Jirbes vai enfileirar é a
A123, que vai para a primeira fila. Jirbes deve sempre alternar entre as
fileiras, então a segunda tarefa que deve ser enfileirada é B123, que vai para a
segunda fila, já que ela está livre. Na sequência, a próxima tarefa que deve ser
enfileirada é a A456.

Como A123 demora 50 unidades de tempo par ser concluída, e B123 demora 10,
B123 será concluída antes que A123. Assim, a próxima tarefa A456 deve ser
enfileirada junto com B123.

Em seguida, como as filas devem sempre ser alternadas, a tarefa B456 é
enfileirada. Já que o tempo total de B123 e A456 juntos (30) ainda é menor
que o tempo de execução de A123 (50), B456 é enfileirada na fila logo após A456.

As filas de execução de tarefas no núcleo final são:

```
A123 B789
B123 A456 B456 A789
```

# Loja de poções

Eliehser Pehreirae é um vendedor de poções de Araraçatuba. Como é o único alquimista
do reino, Eliehser abusa dos preços de suas poções e atende apenas um cliente por
dia. O resto do tempo, Eliehser aproveita para conseguir os ingredientes
necessários, que são escassos. Por essa razão, além de aceitar apenas uma
pessoa, ele só pode atender pedidos que consegue fazer com os ingredientes
disponíveis.

Todos os dias, Eliehser cria uma lista com as poções que pode fazer e os
ingredientes que estão disponíveis. Sempre que os pedidos chegam, ele precisa
analisar cada um deles, avaliando as poções solicitadas, verificando se tem a
receita para a poção e os ingredientes necessários para cada uma delas.

Tendo isso em mente, o alquimista escolhe sempre atender o pedido que vai pagar
mais pelo trabalho do dia.

Por exemplo:

```ruby
# poções que pode fazer
small_healing: { price: 3, herb: 1 }
      antigas: { price: 5, herb: 1, mushroom: 2 } }

# ingredientes disponíveis
{ herb: 4, mushroom: 2 }

# pedidos de clientes
koffeah: { small_healing: 2 }
   pamb: { small_healing: 1, antigas: 2 } }
```

No contexto acima, Eliehser pode fazer as poções `small_healing`, que custa 3
moedas, e `antigas`, que custa 5 moedas. Analisando os pedidos de `koffeah` e
`pamb`, não há ingredientes disponíveis para fazer 2 poções `antigas`, então não
não é possível atender o pedido de `pamb`. No entanto, o pedido de `koffeah`
pode ser atendido, e como é o único, é também o que vai pagar mais moedas.

Neste desafio, você deve implementar o código que recebe a lista de poções que
Eliehser pode fazer, os ingredientes disponíveis e avalia a lista de pedidos de
clientes, decidindo qual pedido deve ser feito para ganhar mais moedas.

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

# Controle de Segurança

Senhor Robô está achando cada vez mais difícil lidar com os problemas de segurança digital tendo em vista a onda de hackers que só parece aumentar. Por isso, percebeu que precisa criar senhas cada vez mais difíceis para que seus dados estejam devidamente protegidos.

O problema, porém, é que a dificuldade das senhas torna difícil com que Senhor Robô se lembre delas, precisando anotá-las em algum lugar. No entanto, anotar as senhas por si só é um enorme problema de segurança, já que pessoas podem acessar o arquivo onde as senhas estão guardadas.

Para resolver esse problema, Senhor Robô decidiu guardar as senhas encriptadas, de forma que só ele conseguisse decifrar as senhas para uso. Ele as encriptou pegando as senhas e embaralhando todos os caracteres que pertencem a essa senha. Esse embaralhamento foi feito da seguinte forma:

- Para embaralhar a senha, o primeiro passo é separar todas os caracteres dessa senha e, com eles, criar uma `string` inteiramente bagunçada. Essa `string` deve ser formada apenas com os caracteres da palavra original, porém as quantidades que essas letras aparecem na `string` podem ser diferentes, desde que toda letra apareça pelo menos uma vez;
- Esse embaralhamento não era feito de forma aleatória. Ele era feito de forma que, dado um fator `n`, ao dividir a `string` em grupos que possuem esse fator como tamanho, a ordem dos caracteres que aparecem nesses grupos segue a ordem na qual as letras aparecem na senha original.
- Para melhor visualização, considere a senha bola. Ela pode ser embaralhada em conjuntos de 3 caracteres (seguindo as especificações acima) como bol, ola, bla, formando a string final bololabla. Note como cada conjunto possui apenas uma cópia de um caractere e a ordem dos caracteres reflete a ordem na senha original.

Nesse desafio, você deve fazer o código que irá decifrar as senhas que Senhor Robô anotou. Para isso, crie o método `password_decoder` que, dado um arquivo contendo as senhas a serem encriptadas e o fator `n` para cada senha, deve escrever em outro arquivo as senhas originais. Não assuma nada sobre as senhas encriptadas a não ser o fato de que você tem todas as informações necessárias para descobrir a palavra original e de que, na senha original, nenhum caracter se repete.

### Exemplo

Para facilitar a visualização do desafio, vamos assumir uma entrada nesse método com um arquivo:

```ruby
"l3vlve3ve 3"
```

Como `n` é 3, isso significa que se eu dividir essa string em grupos de 3, a ordem dos caracteres que aparecem nesses grupos é a mesma da senha original. Fazendo essa divisão, temos os seguintes grupos:

- l3v lve 3ve

Do primeiro grupo `l3v`, podemos concluir que, na senha original, o caractere l aparece antes do caractere 3 que, por sua vez, aparece antes do caractere v. Do segundo grupo `lve` podemos concluir que, na senha original, o caractere l aparece antes do caractere v que, por sua vez, aparece antes de e. Seguindo o raciocínio e juntando as conclusões, temos que a senha codificada nessa string é `l3ve`.