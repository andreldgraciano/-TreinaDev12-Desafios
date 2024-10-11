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