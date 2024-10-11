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