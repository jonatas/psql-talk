# Psql

Practical psql: fast navigation on your DB using only terminal.

Author: Jônatas Davi Paganini

#### @jonatasdp

# @jonatasdp

* Backend developer
* Ruby/Shell/Postgresql/Vim

    Dev since 2004. Using Ruby since 2007.

#### twitter: @jonatasdp
#### github: @jonatas

# Audience

* Who here worked only on terminal? No GUI?
* No mouse?
* B&W display?

# Agenda

* Terminal?
* Bash intro
* Psql
* Readline
* CLI tools

# Terminal?

* Bash/shell script is the 6th position as most used language in the world.
* Building blocks - lego bricks for developers.
* Extensible
* Flexible
* GUI Independent

# Bash

```
<command> <*options> <*arguments>
```

Welcome to the `REPL`.

* `R`ead
* `E`val
* `P`rint
* `L`ine

# Intro

```
echo hello Scale20x
```

* `echo` is the command
* `hello Scale20x` are the arguments

# Commands

* `whoami` - literally who am I?
* `hostname` - where am I?
* `whatis <command>` - what is `<command>`?
* `man <command>` user manual for the `command`?
* `grep <regular-expression>`

# Arguments

Arguments are all the words after the command name.
```
whatis whoami
   |      ↪ argument
   +-> command
```

# Alias

Long arguments start with `--`

```
psql --dbname <dbname>
```

but an short equivalent can be used with `-`

```
psql -d <dbname>
```

# Options

Special arguments prefixed with `-` or `--`.

```
echo -e "hello\nworld"
```

* `-e` break lines when found the `\n`.

# Combining

Options can be combined:

```
ls -lah
```
Same as:

```
ls -l -a -h
```

# Sub-shell

* `$()` allow to execute a sub-shell

```
echo $(whoami) you are at $(hostname)
jonatasdp you're at MacBook-Pro
```

# Vars

```
A=1; B=2; echo A + B = $(expr $A + $B)
```

* `;` command delimiter
* `echo` is the command
* `expr` command to compute math expressions

# Operadores

* `>` send output to a new file or device.
* `>>` concatenate output in the end of a file.
* `|` concatena the output to another command.

# Redirect

The `>` redirects the output to a file

```
echo hello > scale20.txt
```

    Also check the `<` operator.


# Append `>>`

Concatenate to the same file.

```
echo welcome >> scale20x.txt
```

Print file to the output:

```
cat hello_pt_br.txt
```

# Pipe `|`

Concatenate commands:

```
cat scale20x.txt | grep welcome
```
    Print only lines that includes "welcome"

# File system

* `.` current directory
* `..` parent directory
* `~` "home" ou user directory
* `/` refers to directory limit

# File system

Useful file system commands:

* `cat` prints file content in the terminal.
* `head` prints the first lines of the file.
* `tail` print last lines of the file.
* `more` open a reader like a pager.
* `wc` word count - count lines too.
* `cd` change directory
* `ls` list content.
* `pwd` print working dir.
* `grep` filter text with regular expression.

# readline

Cursor navigation:

* `ctrl-a` - move cursor to beginning of line.
* `ctrl-e` - move cursor to the end of the line.
* `ctrl-b` - move cursor back.
* `ctrl-f` - move cursor forward.
* `ctrl ←` ou `esc-b` -  back one word.
* `ctrl →` ou `esc-f` ou `esc-l` - forward one word.

Editing:

* `ctrl-r` - Insert previous commands using reverse history.
* `ctrl-d` - remove one letter.
* `ctrl-w` - remove one word.
* `esc-backspace` - erase word.

# vars

Global variables:

* `!!` previous command
* `!$` last argument of previous command
* `$OLDPWD` previous directory
* `$PATH` set of directories for binaries
* `$USER` logged user name
* `$HOME` home directory path

# process matrix

* `ctrl-z` send a process to background
* `fg` foreground a background process
* `echo $0` verify what shell are you using

# PSQL \o/

```
FINALLY \o/
```

# psql

```
man psql
```

# Conecting

```
psql -U<user> -h<host> <dbname>
```

Or

```
psql "dbname=<database name> user=<username> host=<hostname>"
```

## pg_service.conf

Wrap your connection params into `~/pg_service.conf`.

```
cat ~/.pg_service.conf
[playground]
dbname=playground
user=jonatasdp
host=localhost
```

Then, use the service argument:

```
psql service=playground
```

# dotenv

```
cat .env
export PG_URI=postgres://jonatasdp@localhost:5432/dbname
```

Source the `.env` to load the environment variable:

```
source .env
psql $PG_URI
```

# Vars

* `PGHOST` instead of `--host` or `-h`
* `PGUSER` instead of `-U` or `--user`
* `PGPASSWORD` instead of type the password
* `PSQL_EDITOR` configure your favorite editor when using `\e`

# Help

Learn the manual with:

* `man psql`

Inside psql:

* `\?` help and learn about psql commands
* `\h` help and learn the SQL syntax

# tab

> Tab = Autocomplete

* Works on bash
* Works with a lot of commands
* Limit the options
* Allow to navigate and choose from options

    ```
    Pro-tip: Avoid typing, use tab ;)
    ```

# Connecting

* `\l` List databases.
* `\c` Connect to a specific database.
* `\q` Disconnect/exit from the psql.

# Describe

* `\d` describe objects
* `\dt` for tables
* `\di` for indices
* `\df` for functions

    Use the `+` as a modifier to get more details

# createdb

The `createdb` allows you to create a database without entering on the psql.

```
createdb scale20x
psql scale20x
```

# cursor

The cursor shows you what DB you're connected.

```
playground=#
```

* `#` means you're admin
* `>` means you're a regular user
* `=` new command
* `-` pending to finish a command
* `*` pending to commit or abort a transaction
* `'` inside a string

# help command

Get help about the command `create table`
```sql
\h create table
```
After use:

```sql
create table participants (id serial, name text);
```

# inserting

Insert some data:

```sql
INSERT INTO participants (name) VALUES ('Jônatas'),
('Letícia'),
('William'),
('Kenia');
```

# selecting

`TABLE` is a shortcut to `SELECT * FROM` ;)

```sql
TABLE participants;
```

# gdesc

```
\gdesc
```

Describes the data types of the last query.

# timing

Enabling:

```sql
\timing on
```

Disabling timing:

```sql
\timing off
```

# latency

Connect to a remote server to test the latency:

```sql
\timing on
tsdb=> ;
Time: 169.258 ms
```
# bash

Use `\!` to run a bash inside psql:

Use the ip from `\conninfo` and run a `whois` filtering by country:

```
\! whois <ip> | grep Country
```

# pg_dump

Backup a table into a file:

```
pg_dump scale20x --table participants  > participants.sql
```

# loading data

Loading backup data from a file:

```
psql bkpscale20x < participants.sql
```
or

```
cat participants.sql > psql bkpscale20x
```

or

```
psql bkpscale20x -f participants.sql
```

# pipe

Loading backup without touching the disk:

```
pg_dump scale20x --table participants | psql bkpscale20x
```

# \pset

**Print Settings** for psql

```
\pset <tab><tab>
```

# pager

Disable pager

`\pset pager off`

Enable pager

`\pset pager on`

# pager

Shortcuts:

* Use `ctrl-a -S` to chop lines.
* Use `shift-g` to go to the end of the output.
* `Enter` or `j`: Move down one line
* `Space` or `f`: Move down one page
* `b`: Move up one page
* `/`: Search forward for a pattern
* `?`: Search backward for a pattern
* `n`: Repeat the previous search in the same direction
* `N`: Repeat the previous search in the opposite direction
* `q`: Quit the pager and return to psql

# format

Change format to CSV:

```
\pset format csv
```

Change format to HTML:

```
\pset format html
```

# \x

Expand columns to rows.

```
\x on
```

Disable it:

```
\x off
```

Exemple using `\df`.

# \o

Use `\o` to redirect the output to a file.

Similar to `>>` on bash.

```
\o arquivo.txt
```

# \g

* `\g` repeat the last command.
The `\g <file>` repeats the last command and redirect the output to a file.

```
\pset format csv
table participants;
\g output.csv
```

# \watch

Similar to `\g` but it repeats automatically every 2 seconds:

```sql
TABLE pings ORDER BY t DESC LIMIT 5;
```

Run network latency example.

# \gexec

Execute sql from last query:

[Exemplo](https://gist.github.com/jonatas/340294dfb66cddc9af072ee21d49dfff).

# CLI extras

* `tldr` show examples of most common terminal tools.
* `brew` for Mac, install via command line.
* `tmux` use for multi window.
* `screen` useful for pairing on terminal
* `gh` CLI do github.
* `fuck` explore alternative command suggestions.

# Links

* [psql-tips.org](https://psql-tips.org)
* [Lætitia Avrot: `psql` is awesome!](https://www.youtube.com/watch?v=2oFbnJDlwIw)
* [how to install psql](https://docs.timescale.com/timescaledb/latest/how-to-guides/connecting/psql/#install-psql-on-macos).

# Thank you!

- {Twitter,Instagram,Linkedin} [@jonatasdp](https://twitter.com/jonatasdp)
- Github: [@jonatas](https://github.com/jonatas)


#### Jônatas Davi Paganini
