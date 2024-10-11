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