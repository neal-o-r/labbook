# Lab book

An extremely simple lab book making script. Creates a directory structure, opens a file, runs make to generate a static site. What more could you want.

You can get a fairly decent terminal version of the same with these 3 commands:

```
function mdless() {
      pandoc -s -f markdown -t man $1 | groff -T utf8 -man | less
}

notesedit() { mkdir -p ~/.notes; vim ~/.notes/$1.md; }
notes() { mdless ~/.notes/"$1".md; }
notesls() { ls ~/.notes }
```

