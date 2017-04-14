
all:
	gcc -o foo foo.c -lm -I'.'

install:
	install -m 0755 -d $(DESTDIR)/etc
	install -m 0644 foo.cfg $(DESTDIR)/etc/foo.cfg
	install -m 0755 -d $(DESTDIR)/bin
	install -m 0755 foo $(DESTDIR)/bin/foo
	rm -f foo

clean:
	rm -f foo
