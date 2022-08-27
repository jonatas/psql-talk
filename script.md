# Zen life no terminal
### Jônatas Davi Paganini

Olá pessoal, espero que estejam bem! Meu nome é Jônatas e trabalho com
programação desde que meus 17 anos de idade.

Quando eu comecei, tudo que eu tinha era o terminal! Então de alguma forma, a
vida sem interface gráfica parecia muito mais fácil e focada do que nos dias
atuais.

* Quem aqui já trabalhou em computador sem interface gráfica?
* Sem mouse?
* Com monitor preto e branco?
* Cartão perfurado?

Pelo que vejo temos uns dinossauros da tecnologia por aqui! E isso é muito bom!

Enfim, minha primeira linguagem de programação foi clipper! Na verdade se
chamava flagship e compilava só pra linux mas implementava a especificação da
linguagem clipper. Meu chefe na época, implementou o driver pra Postgresql para
o Flagship na unha em C e portou criando os bindings pro Flagship então uma das
minhas tarefas, lá em 2004 era importar os códigos que salvavam informações em
um tal de DBF para Postgresql usando inserts.

> Quem aqui chegou a usar DBF?

DBF era puramente como se fosse um CSV mas permitia vc adicionar uns arquivos
extras chamados DBI que eram os indices do banco de dados em formato de arquivo.

Cada DBF representava uma tabela mas era um arquivo independente. Programar com
DBFs exigia abrir arquivos DBFs independentes e fazer os joins na unha.

A vida era bem difícil naquele tempo :D

Mas a parte boa é que nessa época eu não tinha acesso a internet, e também não
tinha distração alguma para usar o computador.

Então a vida era só programar, o dia todo. Sem notificações ou qualquer tipo de
interrupção. Eu lembro que meu editor era o MCedit -  Midnight commander :)

F2 salvava um arquivo e F7 buscava no arquivo. O resto esqueci tudo. Mas lembro
que o fundo do editor era azul :)

Estou dando esse exemplo de F2 e F7 só pra enfatizar que tenho uma péssima
memória, que por mais que usei por 2 anos o editor consegui esquecer de todos os
atalhos. E muitas vezes as pessoas ficam olhando agente trabalhar no terminal e
acham que agente sabe o que tá fazendo, mas é uma questão de fluxo de trabalho,
memória muscular e também habitos. Nem sempre você vai lembrar os atalhos mas
parece que eles aparecem nos dedos.

O que eu mais gostava dessa empresa que eu trabalhava era que não deixavam levar
o código pra casa, então de noite eu tinha que codar outra coisa e quando tinha
um bug muito malandro ou eu precisava entender algo complexo, eu tinha a
possibilidade de imprimir o código na impressora matricial. Então eu podia
levar um rolinho de papel contínuo com todos os códigos de um determinado
arquivo.

Eu fazia anotações com a caneta e no outro dia podia testar minhas hipóteses e
fazer as modificações no meu terminal burro.

> Quem aqui lembra ou usou um terminal burro?

Antigamente pessoal, tinham computadores que não tinham HD para polpar dinheiro,
então tu dava o boot pela rede, e usava o sistema operacional de um servidor
diretamente pela rede. Sem interface gráfica tudo ficava muito barato e funcionava
em tempo real mesmo. Apenas com 24 linhas e 80 colunas de puro texto ficava
fácil estar em tempo real :)

No servidor, rodava como se fosse uma espécie de docker, que permitia eu usar
teclado e monitor externo e a memória local para algumas coisas. Lembro que lá
por 2006 eu já rodava x11 no terminal burro e era possível até usar o mouse ;)

Masssss, meu objetivo aqui é a vida sem mouse, no terminal. Lembrando que não
estou aqui pra converter ninguém pro terminal, pro VIM ou qualquer coisa, mas
sim pra mostrar como é mais fácil entrar na dinâmica de trabalhar a partir do
terminal.

O terminal é uma tela preta que não faz nada que você não peça. Ela não interage
com você se você não interagir. Ela não te notifica. Ela não te distrai. Então,
essa é a parte Zen do terminal. Você é o monge da montanha encantada e só
depende de você para meditar e concentrar naquilo que precisa fazer.

Eu gosto muito da ideia de concentrar e no fim isso me leva a trabalhar menos.

Menos horas na frente da tela preta e mais liberdade pra fazer o que eu quero.
Por isso é importante aprender a viver longe do ambiente de distrações.

Pareço um pouco repetitivo então vamos entrar na parte prática! Eu uso sistemas
baseados em unix desde o início da minha carreira e nunca consegui literalmente
me livrar do terminal.

Resolvi organizar essa talk para mostrar as coisas que percebi durante anos
pareando e ajudando pessoas a se distraírem menos no terminal :D

Meu objetivo aqui é mostrar dicas relacionadas a usar o terminal e ferramentas
que podem te ajudar a ser feliz por aqui.

# PSQL

O foco central dessa sessão é mostrar o psql, mas também iremos ir e voltar
em várias outras ferramentas.

## Terminal intro

Vamos começar com um breve introdução ao terminal. Eu não vou ficar fazendo um
tutorial de cada detalhe do terminal nem contando a história dele mas gostaria de
mostrar algumas coisas que vão te fazer entender melhor o fluxo de trabalho.

Então, a primeira coisa, é entender o cursor. Quando você entra, você tem que
sempre localizar onde ele está. Geralmente ele está piscando.
E seu foco se move juntamente com o cursor. O cursor sempre é a última informação
da tela, aparecendo mais a baixo e o que vem depois dele é sempre o espaço restante da tela.

O terminal também é conhecido como **linha de comando** pois é ali que você
interage com o computador da maneira mais rudimentar. A linha de comando nada
mais é que um REPL -> Read, Eval e Print Line, ou seja, ele lê a informação que
você digita quando você digita um comando e dá um enter, então valida e compila,
e imprime de volta o resultado do comando.

Então vamos começar descobrindo quem sou eu com o `whoami` que é o primeiro
comando que vocês irão aprender :D

Eu sei que muita gente já conhece o terminal aqui mas é legal vocês darem
oportunidade para os novos entrarem nessa vibe :P

Então, `whoami` retornou esse nome aí pra mim, dizendo meu nome. Agora, já
complicando um pouco mais, vou introduzir aqui um comando echo que é um comando
que basicamente imprime o que eu estou pedindo:

```
echo (whoami) você está no seu (hostname)
jonatasdp você está no seu MacBook-Pro
```

Como vocês podem ver, eu usei essa sintaxe entre parenteses e basicamente ela
executou uma linha de comando aninhada e o returno foi injetado no código.

Aí, nesse momento, você deve já usa o terminal deve estar pensando, esse cara
está maluco, já confundindo a cabeça das pessoas navegando entre multiplos
shells. Então como vocês podem ver no topo do meu terminal, eu troquei meu
terminal pra usar o fish ao invés do bash. Bash é o terminal padrão, mas ele é
muito rudimentar e eu acabo usando mais o fish.

Para não complicar muito essa palestra, irei usar o bash e facilitar a vida de
vocês, mas se você nao adotou ainda um, eu gosto muito do fish, quando alguma
coisa não dá certo, eu entro dentro do shell novamente.

Lembrando que o terminal é uma matrix, então você pode ter várias inceptions
aqui. Você pode abrir um fish, e dentro dele abrir um bash e aí abrir um outro
bash ou fish dentro da sessão que você já está rodando.

Você pode até acabar em outro computador executando coisas em uma cloud se você
não perceber onde está e tudo isso torna as coisas mais difíceis se você não
prestar atenção.

Existem várias ferramentas que permitem alterar esse comportamento e também
existem aplicativos no terminal que permitem você navegar com o cursor para
lugares diferentes.

### Ergonomia dos comandos

Um comando geralmente é um outro software que pode ser chamado pela linha de comando.

Ele segue  a seguinte lógica:
```
<comando> <*argumentos>
```

Ele também pode conter variáveis:

```
A=1; B=2; echo A + B = $(expr $A + $B)
```

O comando também pode conversar com outros comandos através dos operadores. Por
exemplo, o `>` permite enviar os dados para uma saída diferente da tela.

```
psql meu_banco -f selecionar_clientes.sql > clientes.txt
```

Ou pode receber informações de outros comandos com o `|`

```
echo '\dt' | psql
```

### Atalhos importantes

Pra você sobreviver na linha de comando é necessário aprender atalhos para
ganhar tempo. Isso não quer dizer que você não consiga viver sem, mas eles vão
te dar mais liberdade e fluidez para seguir uma vida mais sana.

### Terminal readline

* `ctrl-a` - move cursor to begin of line
* `ctrl-e` - move cursor to end of line
* `ctrl-b` - move cursor backwards
* `ctrl-f` - move cursor  forward
* `ctrl-r` - get reverse history
* `ctrl-d` - remove char
* `ctrl-w` - remove word
* `ctrl-p` - previous line


## history

O history é muito legal para encontrar comandos que você digitou no passado e
também re-executar eles com facilidade.

history | grep psql

```
!<numero-do-comando>
```

Ou usar o `<ctrl-r>` e buscar pelo comando.

## man

man é o manual de tudo na linha de comando. Então se você precisa entender a
especificação de um determinado comando é a forma mais rápida de aprender e
verificar como ele funciona.

## tldr

Eu gosto muito do tldr pq eu geralmente não lembro dos comandos e eu só preciso
de um exemplo pra seguir fazendo o que eu preciso, então, o TLDR que é um
acronimo para Too Long Don't Read, é super útil para me dar o exemplo certo na
hora certa.

## Community favorites

Logo que eu comecei a organizar essa talk acabei twittando sobre o assunto e
vendo quais eram os tipos favoritos da comunidade e também quero deixar aberto
aqui para as pessoas que usam alguma outra dica especial, comenta lá na minha
thread do twitter. Vou pinar ela aqui agora e se vocês acessarem meu twitter,
sou o jonatasdp lá, você pode adicionar seu tip e vamos reservar um espaço no
final para verificar as dicas que vocês adicionaram!

https://twitter.com/jonatasdp/status/1525080863473647618

## Print set com `\pset`

O pset ou printset é muito parecido com o `\set` que funciona para qualquer
cliente do postgresql mas é focado em print. Ou seja, ele vai te ajudar a
formatar a saída de dados do formato que você espera.

Um exemplo da comunidade que adorei e nunca tinha usado é o override para
valores nulos.
Por exemplo, se você usar:

```sql
select null;
?column?

```
então fica difícil de entender que a linha em branco quer dizer nulo:

Aí você pode reconfigurar o null para exibir algo de sua preferência:

```=# \pset null '<nulo>'
Null display is "<nulo>".
test_100k=# select null;
?column?
<nulo>

```
Gente, lembrando que é unicode também, e você pode ter os seus próprios emojis
pra tornar tudo mais divertido:

```sql
 \pset null '🙈'
Null display is "🙈".
```

Adoro esse macaquinho, bora testar ;)

```sql
select null;
?column?
🙈
```

## `\watch` para assistir queries

O comando `\watch` é  incrível pra evitar você ficar repetindo o mesmo comando e
permite vc criar um mini-dashboard, literalmente assistindo uma determinada
query.

Por exemplo, vou iniciar aqui um exemplinho pra ficar mais claro. Esse exemplo,
temos aqui um simples ping pra alguns websites então vou mostrar o código pra
vocês.

Então temos aqui o `network-latency` que é um mini projetinho só pra medir a
latencia da rede. Estou literalmente dando um ping nas principais redes sociais
e salvando no banco de dados o tempo de resposta.

Como vocês podem ver meu `.env` aqui, pois adoro organizar esses arquivos com as
variáveis de ambientes que torna tudo mais simples de trabalhar.

Esse arquivo pode ser carregado automagicamente por uma ferramenta chamada
`direnv` mas pra ficar mais claro, neste exemplo, vou usar usando o `dotenv`
que também é uma pequena biblioteca que faz a mesma coisa.

Então aqui está o arquivo, similar a variáveis no bash, mas não estou
exportando.

```
cat .env
```

Pra carregar uso o `dotenv .env` e depois vocês podem ver que tenho a variável
disponível nessa sessão:

```
echo $PG_URI
```

Conectando no postgresql com a variável:

```
psql $PG_URI
```

E agora vamos começar com `\d` para mostrar a tabela:

```
\d pings
```

Em paralelo vamos ver se o `bin/track` está funcionando:

```
bin/track
```

Esse comando vai ter que rodar a cada segundo para termos algo pra mostrar então
vou usar o `watch` do terminal pra ficar repetindo o mesmo comando:

```
watch -n 1 bin/track
```

Lembrando que este watch não é o mesmo do psql mas é a inspiração pra existir
dentro do psql, pois server o mesmo propósito.

Então limitando os ultimos 5 registros temos:

```sql
select * from pings order by 1 desc, 3 asc limit 5;
```

Agora, se queremos assistir é só digitar `\watch`:

E também vale a pena truncar por segundos no datetime só pra mostrar apenas o
que queremos:

```
select date_trunc('second',t::timestamp), ms, host from pings order by 1 desc, 3 asc limit 5;
\watch
```

## `\gexec` pra rodar comandos a partir da query anterior

Da prá reutilizar comandos sql gerados pelo próprio sql então vamos começar
gerando uns dados só pra se divertir:

```sql
select a from generate_series(1,10) a;
```

Agora, se quisermos gerar 10 SQLs a partir desses comandos faríamos:

```sql
select 'select '||a from generate_series(1,10) a;
```

Pra pegar esse último output e executar como SQL é só usar o `\gexec`.

    Alguma pergunta pessoal? Tudo ok? podemos prosseguir com os tópicos?

## Output 

`\g <arquivo>` envia ultima query para um arquivo.
`\o <arquivo>` concatena os resultados para um arquivo.

Uma dica para quem está gostando de se aprofundar nos comandos é dar uma olhada no site 
https://psql-tips.org que contém uma série de exemplos de como evoluir nos
comandos.

Eu gosto muito do `psql -E` que ajuda você a entender os comandos com a barra
invertida. Por exemplo `\dt` vai listar as tabelas mas que query o psql usou
para saber isso?

Exemplos:

```sql
\dt
\df
\ds
```


Lembrando que o -E vai funcionar apenas para comandos que envolvem queries e não
para outros comandos. Exemplo o `\x`. Observe o output:

```sql
table pings limit 1;
┌─[ RECORD 1 ]──────────────────────┐
│ t    │ 2022-08-05 14:23:21.439023 │
│ ms   │ 0.0031                     │
│ host │ google.com                 │
└──────┴────────────────────────────┘
```

O `\x` serve para trocar o modo de visualização de tabelas em linhas ou colunas,
de forma expandida ou não.

```sql
latency=# \x
Expanded display is off.
latency=# table pings limit 1;
┌────────────────────────────┬────────┬────────────┐
│             t              │   ms   │    host    │
├────────────────────────────┼────────┼────────────┤
│ 2022-08-05 14:23:21.439023 │ 0.0031 │ google.com │
└────────────────────────────┴────────┴────────────┘
(1 row)
```

Também é possível usar o `\x auto` que irá mudar a visão automaticamente para
mostrar colunas em linhas caso o conteúdo tenha muitas colunas.

Um exemplo fácil de entender isso é usando o `\df` pois as funções tem vários
parâmetros e geralmente uma documentação extensa, então nem num monitor 4k dá
pra ver tudo :)

### psql comandos com `\`

O psql tem vários comandos que começam com a barra invertida e eles se tornam
extremamente úteis para não ter que lembrar de todos os comandos. Então é só
lembrar do `?` para listar esse help com todos os comandos com barra invertida.

```
\?
```

Aqui você pode relembrar sempre que precisar de um atalho rápido. Um detalhe
importante quando você ver esse `:` na última linha da explicação, isso
significa que o pager está em ação. O more é um utilitário de pager assim como o `less`.

Então vamos aprender um pouco sobre estes dois amiguinhos agora.

Esse comando vai listar todos os comandos com uma explicação.

```
\h
```

Segue a lista de saída:

```
* \d
* \dv
* \d+
* \dt
* \dn
* \sv
* \sf
* \set - https://twitter.com/jonatasdp/status/1529629727211806720
```

## Configurations
```sql
\pset numericlocale # Locale-adjusted numeric output is on.
\set io_timing_track # useful to explain queries
```

## Small project example

Network latency:

## Second project example

https://gist.github.com/jonatas/340294dfb66cddc9af072ee21d49dfff
