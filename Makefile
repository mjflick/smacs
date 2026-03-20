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
DATADIR = $(PREFIX)/share/smacs
CONFDIR = /etc

install: smacs
	install -d $(DESTDIR)$(BINDIR)
	install -m 755 smacs $(DESTDIR)$(BINDIR)/smacs
	install -d $(DESTDIR)$(MANDIR)
	install -m 644 smacs.1.md $(DESTDIR)$(MANDIR)/smacs.1
	install -d $(DESTDIR)$(DATADIR)/syntax/syntax
	install -d $(DESTDIR)$(DATADIR)/syntax/ftdetect
	install -m 644 syntax/syntax/*.vim $(DESTDIR)$(DATADIR)/syntax/syntax/
	install -m 644 syntax/ftdetect/*.vim $(DESTDIR)$(DATADIR)/syntax/ftdetect/
	install -d $(DESTDIR)$(DATADIR)/complete
	install -m 644 complete/*.complete $(DESTDIR)$(DATADIR)/complete/
	install -d $(DESTDIR)$(CONFDIR)
	@if [ ! -f $(DESTDIR)$(CONFDIR)/smacsrc ]; then \
		install -m 644 smacsrc $(DESTDIR)$(CONFDIR)/smacsrc; \
	else \
		echo "$(CONFDIR)/smacsrc already exists, not overwriting"; \
	fi

uninstall:
	rm -f $(DESTDIR)$(BINDIR)/smacs
	rm -f $(DESTDIR)$(MANDIR)/smacs.1
	rm -rf $(DESTDIR)$(DATADIR)
	rm -f $(DESTDIR)$(CONFDIR)/smacsrc

.PHONY: all debug clean install uninstall
