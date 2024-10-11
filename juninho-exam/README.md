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