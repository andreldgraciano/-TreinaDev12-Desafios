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