# Lab book

An extremely simple lab book making script. Creates a directory structure, opens a file, runs make to generate a static site. What more could you want.

You can get a fairly decent terminal version of the same with these 3 commands:

```
# show markdown like a man page
function mdless() {
      pandoc -s -f markdown -t man $1 | groff -T utf8 -man | less
}

# open/create notes file for today
notes() { mkdir -p ~/.notes; vim ~/.notes/`date +'%Y-%m-%d'`.md; }

# see the notes - for today by default 
notesview() { 
  if [ $# -ge 1 ]
  then
     mdless ~/.notes/"$1".md
  else
     newest=`ls -1a ~/.notes/ | sort | tail -1`
     mdless ~/.notes/$newest
  fi 
}

# list the notes dir
notesls() { ls ~/.notes }
```

