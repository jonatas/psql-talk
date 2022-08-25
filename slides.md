
# Zen Life

Autor: Jônatas Davi Paganini

#### @jonatasdp

# @jonatasdp

* Backend developer
* Ruby/Shell/Postgresql/Vim

    Programador desde 2004.

#### twitter: @jonatasdp
#### github: @jonatas

# Audience

* Quem aqui já trabalhou em computador sem interface gráfica?
* Sem mouse?
* Com monitor preto e branco?
* Cartão perfurado?

# Agenda

* why
* bash intro
* psql
* readline
* CLI tools

# Why

* Sexta linguagem mais usada no mundo
* Building blocks - lego dos programadores
* Extensível
* Flexível
* Independente da interface gráfica

# bash

```
<comando> <*opções> <*argumentos>
```

Bem vindo ao `REPL`.

* `R`ead
* `E`val
* `P`rint
* `L`ine

# Intro

```
echo olá mundo
```

* `echo` é o comando
* `olá mundo` são os argumentos

# Comandos

* `whoami` quem sou eu?
* `hostname` onde estou?
* `whatis <comando>` o que é `<comando>`?
* `man <comando>` como usar `comando`?
* `grep <expressão-regular>`

# Argumentos

Argumentos são todas as palavras depois do comando
```
whatis whoami
   |      ↪ argumento
   +-> comando
```

# Alias

Geralmente argumentos longos começam com `--`

```
psql --dbname <dbname>
```

e curtos com `-`

```
psql -d <dbname>
```

# Options

Opções são argumentos especiais que iniciam com `-` ou `--`.

```
echo -e "olá\nmundo"
```

* `-e` quebra linhas quando encontra um `\n`.

# Combinando

Opções podem ser combinadas:

```
ls -lah
```
é o mesmo que:

```
ls -l -a -h
```

# Sub-shell

* `$()` permite uma sub-shell

```
echo $(whoami) você está no seu $(hostname)
jonatasdp você está no seu MacBook-Pro
```

# Vars

```
A=1; B=2; echo A + B = $(expr $A + $B)
```

* `;` delimitador de linhas
* `echo` é o comando
* `expr` comando para computar expressões

# Operadores

* `>` envia saída para um novo arquivo.
* `>>` envia saída para o final de um arquivo.
* `|` concatena saída para outro comando.

# Redireciona

O `>` redireciona saída para um arquivo.

```
echo olá mundo > hello_pt_br.txt
```

    Gostou do `>` aproveite para ver o `<` também ;)


# Append `>>`

Concatena no mesmo arquivo.

```
echo bem vindo >> hello_pt_br.txt
```

Imprime arquivo na linha de comando:

```
cat hello_pt_br.txt
```

# Pipe `|`

Concatena comandos:

```
cat hello_pt_br.txt | grep mundo
```
    Imprime apenas as linhas do arquivo que possuem a palavra mundo.

# File system

* `.` refere-se ao diretório atual
* `..` diretório acima
* `~` refere-se ao "home" ou diretório do usuário
* `/` divisor de diretórios

# File system

Comandos utilitários para arquivos:

* `cat` lê todo conteúdo do arquivo na linha de comando
* `head` lê apenas primeiras linhas do arquivo
* `tail` lê apenas últimas linhas do arquivo
* `more` lê arquivo com pager
* `wc` conta linhas
* `cd` vai para um diretório
* `ls` lista conteúdo de um diretório
* `pwd` mostra diretório atual

# readline

Navegando cursor:

* `ctrl-a` - move cursor para o começo da linha
* `ctrl-e` - move cursor para o fim da linha
* `ctrl-b` - move cursor para trás
* `ctrl-f` - move cursor  para frente
* `ctrl ←` ou `esc-b` -  volta uma palavra
* `ctrl →` ou `esc-f` ou `esc-l` - avança uma palavra

Editando:

* `ctrl-r` - Usa o histórico de forma reversa
* `ctrl-d` - remove uma letra
* `ctrl-w` - remove uma palavra
* `esc-backspace` - apaga palavra


# vars

Algumas variáveis úteis:

* `!$` último argumento da linha anterior
* `!!` último comando
* `$OLDPWD` último diretorio
* `$PATH` diretórios oficiais para buscar comandos
* `$USER` nome do usuário
* `$HOME` caminho para o diretório do usuário

# process matrix

* `ctrl-z` envia processo para background
* `fg` resgata processo em background
* `echo $0` verifica qual shell está usando

# PSQL \o/

```
FINALLY \o/
```

# psql

```
man psql
```

# Conectando

```
psql -U<user> -h<host> <dbname>
```

Ou

```
psql "dbname=<database name> user=<username> host=<hostname>"
```

## pg_service.conf

```
cat ~/.pg_service.conf
[playground]
dbname=playground
user=jonatasdp
host=localhost
```
Então só usar o argumento service:

```
psql service=playground
```

# dotenv

```
cat .env
export PG_URI=postgres://jonatasdp@localhost:5432/dbname
```

Source para carregar um arquivo bash:

```
source .env
psql $PG_URI
```

# Vars

* `PGHOST` ao invés de `--host` ou `-h`
* `PGUSER` ao invés de `-U` ou `--user`
* `PGPASSWORD` para não digitar a senha
* `PSQL_EDITOR` permite você configurar qual editor usar com `\e`

# Help

Ajuda pode ser obtida com:

* `man psql` para saber mais sobre o cliente

Dentro do psql:

* `\?` para saber sobre todos comandos do psql
* `\h` para aprender sobre SQL

# tab

> Tab = Autocomplete

* Funciona no bash
* Funciona para comandos
* Limita as opções
* Permite navegar e escolher as sugestões

    ```
    Pro-tip: Não tente digitar, use tab.
    ```

# Conectando

* `\l` Lista os bancos disponíveis em um servidor
* `\c` conecta em um banco específico no mesmo servidor.
* `\q` desconecta do banco e sai do psql

# Describe

* `\d` para descrever objetos
* `\dt` para tabelas
* `\di` para indices
* `\df` para funções

    Use o `+` para mais detalhes.

# createdb

O `createdb` permite criar um banco de dados sem entrar no servidor.

```
createdb pgconfbr2022
psql pgconfbr2022
```

# cursor

O cursor mostra o banco que você está conectado.

```
playground=#
```

* `#` significa que você é admin
* `>` significa que você é um usuário simples
* `=` novo comando
* `-` comando em andamento
* `*` em meio a uma transação
* `'` em meio a uma string

# help command

Para obter ajuda sobre o comando `create table`
```sql
\h create table
```
Depois use:

```sql
create table participants (id serial, name text);
```

# inserting

Inserindo alguns participantes:

```sql
INSERT INTO participants (name) VALUES ('Jônatas'),
('Letícia'),
('William'),
('Kenia');
```

# selecting

`TABLE` é o melhor atalho para `SELECT * FROM` ;)

```sql
TABLE participants;
```

# gdesc

```
\gdesc
```

Descreve os tipos de dados da última query.

# timing

Habilitando:

```sql
\timing on
```
Desabilitando benchmarks:

```sql
\timing off
```

# latencia

Conecte-se em um servidor remoto e teste a latência:

```sql
\timing on
tsdb=> ;
Time: 169.258 ms
```
# bash

Use `\!` para rodar um comando bash dentro do shell:

Use o ip do `\conninfo` e rodar um `whois` filtrando pelo país:

```
\! whois <ip> | grep Country
```

# pg_dump

Backup de uma tabela em um arquivo:

```
pg_dump pgconfbr --table participants  > participants.sql
```

# loading data

Carregando backup do arquivo:

```
psql bkppgconf < participants.sql
```
ou

```
cat participants.sql > psql bkppgconf
```

ou

```
psql bkppgconf -f participants.sql
```
# pipe

Descarregando backup sem usar o disco:

```
pg_dump pgconfbr --table participants | psql bkppgconf
```

# \pset

Configurações de impressão: **Print Settings**

```
\pset <tab><tab>
```

# pager

Desabilitar o pager:

`\pset pager off`

Habilitar novamente:

`\pset pager on`

# format

Muda formato para CSV:

```
\pset format csv
```

Muda formato para HTML:

```
\pset format html
```

# \x

Habilita expansão de colunas em linhas.

```
\x on
```
Desabilita:

```
\x off
```

Exemplo com `\df`.

# \o

Use `\o` para direcionar o output para um arquivo.

```
\o arquivo.txt
```
# \g

* `\g` repete ultimo comando.
O `\g <arquivo>` repete ultimo comando enviando resultados para arquivo.

```
\pset format csv
table participants;
\g output.csv
```

# \watch

Similar ao `\g` mas repete automaticamente a cada 1 segundo.

```sql
TABLE pings ORDER BY t DESC LIMIT 5;
```

Exemplo network latency.

# \gexec

Executa sql a partir da última query:

[Exemplo](https://gist.github.com/jonatas/340294dfb66cddc9af072ee21d49dfff).

# CLI extras

* `fuck` explora comandos alternativos quando comando falha.
* `tldr` mostra exemplos de uso dos comandos.
* `brew` para mac, `chocolate` para windows.
* `tmux` para usar um terminal multi janela mais avançado.
* `screen` para fazer pair programming na cloud.

# Links

* [psql-tips.org](https://psql-tips.org)
* [Lætitia Avrot: `psql` is awesome!](https://www.youtube.com/watch?v=2oFbnJDlwIw)
* [how to install psql](https://docs.timescale.com/timescaledb/latest/how-to-guides/connecting/psql/#install-psql-on-macos).

# Obrigado

- {Twitter,Instagram,Linkedin}: [@jonatasdp](https://twitter.com/jonatasdp)
- Github: [@jonatas](https://github.com/jonatas)

#### Jônatas Davi Paganini
