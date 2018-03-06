SOURCE_DOCS := $(patsubst %.md,%.html,$(wildcard */*.md */*/*.md *.md))

EXPORTED_DOCS=\
 $(SOURCE_DOCS:.md=.html)

RM=/bin/rm

PANDOC=pandoc

PANDOC_OPTIONS=--smart --standalone \
	       --to html5 --mathjax \
	       -c ~/labbook_core/github-pandoc.css

# Pattern-matching Rules

%.html : %.md
	@$(PANDOC) $(PANDOC_OPTIONS) -o $@ $<
	@sed -i 's:\.md:.html:g' $@

# Targets and dependencies
.PHONY: all clean

all : $(EXPORTED_DOCS)

clean:
	- $(RM) $(EXPORTED_DOCS)
