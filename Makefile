STRADA ?= strada

# Check for pcre2
PCRE2_LIB := $(shell pkg-config --libs libpcre2-8 2>/dev/null || echo "")

all: smacs

smacs: smacs.strada
	$(STRADA) smacs.strada

debug: smacs.strada
	$(STRADA) -g smacs.strada

clean:
	rm -f smacs smacs.c

PREFIX ?= /usr/local
BINDIR = $(PREFIX)/bin
MANDIR = $(PREFIX)/share/man/man1

install: smacs
	install -d $(DESTDIR)$(BINDIR)
	install -m 755 smacs $(DESTDIR)$(BINDIR)/smacs
	install -d $(DESTDIR)$(MANDIR)
	install -m 644 smacs.1.md $(DESTDIR)$(MANDIR)/smacs.1

uninstall:
	rm -f $(DESTDIR)$(BINDIR)/smacs
	rm -f $(DESTDIR)$(MANDIR)/smacs.1

.PHONY: all debug clean install uninstall
