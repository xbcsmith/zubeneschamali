
all:
	gcc -o bar bar.c -lm -I'.'

install:
	install -m 0755 -d $(DESTDIR)/bin
	install -m 0755 bar $(DESTDIR)/bin/bar
	rm -f bar

clean:
	rm -f bar
