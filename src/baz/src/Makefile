
all:
	gcc -o baz baz.c -lm -I'.'

install:
	install -m 0755 -d $(DESTDIR)/bin
	install -m 0755 baz $(DESTDIR)/bin/baz
	rm -f baz

clean:
	rm -f baz
