## Community favorites

https://twitter.com/jonatasdp/status/1525080863473647618

* \pset null
* \watch -> see network example
* \gexec
* \x auto
* https://psql-tips.org


## Network example

Introduce the network example first, by showing `.env` and `run_timescale_docker`.

```
cat .env
```

Then, load `.env`:

```
dotenv .env
```

Connect on the postgresql instance using the PG_URI:

```
psql $PG_URI
```

And show what is in the table:

```
\d pings
```

First, start the container:

```
bash ./run_timescale_docker.sh
```

Then, see if `bin/track` is working:


```
bin/track
```

If it runs ok, you can watch it every N seconds.

```
watch -n 1 bin/track
```

Now, we can also start the examples in the psql

```sql
select * from pings order by 1 desc, 3 asc limit 5;
```

Truncate seconds to always have the same order:

```
select date_trunc('second',t::timestamp), ms, host from pings order by 1 desc, 3 asc limit 5
\watch
```


## Shortcuts

### Terminal

* `ctrl-a` - move cursor to begin of line
* `ctrl-e` - move cursor to end of line
* `ctrl-b` - move cursor backwards
* `ctrl-f` - move cursor  forward
* `ctrl-r` - get reverse history
* `ctrl-d` - remove char
* `ctrl-w` - remove word
* `ctrl-p` - previous line

### psql

* \h or \?
* \d
* \dv
* \d+
* \dt
* \dn
* \sv
* \sf
* \set - https://twitter.com/jonatasdp/status/1529629727211806720

## tldr

## history

## Configurations
```sql
\pset numericlocale # Locale-adjusted numeric output is on.
\set io_timing_track # useful to explain queries
```

## Small project example

Network latency:


## Second project example

https://gist.github.com/jonatas/340294dfb66cddc9af072ee21d49dfff
