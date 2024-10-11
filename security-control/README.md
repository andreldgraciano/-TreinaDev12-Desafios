# Controle de Segurança

Senhor Robô está achando cada vez mais difícil lidar com os problemas de segurança digital tendo em vista a onda de hackers que só parece aumentar. Por isso, percebeu que precisa criar senhas cada vez mais difíceis para que seus dados estejam devidamente protegidos.

O problema, porém, é que a dificuldade das senhas torna difícil com que Senhor Robô se lembre delas, precisando anotá-las em algum lugar. No entanto, anotar as senhas por si só é um enorme problema de segurança, já que pessoas podem acessar o arquivo onde as senhas estão guardadas.

Para resolver esse problema, Senhor Robô decidiu guardar as senhas encriptadas, de forma que só ele conseguisse decifrar as senhas para uso. Ele as encriptou pegando as senhas e embaralhando todos os caracteres que pertencem a essa senha. Esse embaralhamento foi feito da seguinte forma:

- Para embaralhar a senha, o primeiro passo é separar todas os caracteres dessa senha e, com eles, criar uma `string` inteiramente bagunçada. Essa `string` deve ser formada apenas com os caracteres da palavra original, porém as quantidades que essas letras aparecem na `string` podem ser diferentes, desde que toda letra apareça pelo menos uma vez;
- Esse embaralhamento não era feito de forma aleatória. Ele era feito de forma que, dado um fator `n`, ao dividir a `string` em grupos que possuem esse fator como tamanho, a ordem dos caracteres que aparecem nesses grupos segue a ordem na qual as letras aparecem na senha original.
- Para melhor visualização, considere a senha bola. Ela pode ser embaralhada em conjuntos de 3 caracteres (seguindo as especificações acima) como bol, ola, bla, formando a string final bololabla. Note como cada conjunto possui apenas uma cópia de um caractere e a ordem dos caracteres reflete a ordem na senha original.

Nesse desafio, você deve fazer o código que irá decifrar as senhas que Senhor Robô anotou. Para isso, crie o método `password_decoder` que, dado um arquivo contendo as senhas a serem encriptadas e o fator `n` para cada senha, deve escrever em outro arquivo as senhas originais. Não assuma nada sobre as senhas encriptadas a não ser o fato de que você tem todas as informações necessárias para descobrir a palavra original e de que, na senha original, nenhum caracter se repete.

## Exemplo

Para facilitar a visualização do desafio, vamos assumir uma entrada nesse método com um arquivo:

```ruby
"l3vlve3ve 3"
```

Como `n` é 3, isso significa que se eu dividir essa string em grupos de 3, a ordem dos caracteres que aparecem nesses grupos é a mesma da senha original. Fazendo essa divisão, temos os seguintes grupos:

- l3v lve 3ve

Do primeiro grupo `l3v`, podemos concluir que, na senha original, o caractere l aparece antes do caractere 3 que, por sua vez, aparece antes do caractere v. Do segundo grupo `lve` podemos concluir que, na senha original, o caractere l aparece antes do caractere v que, por sua vez, aparece antes de e. Seguindo o raciocínio e juntando as conclusões, temos que a senha codificada nessa string é `l3ve`.