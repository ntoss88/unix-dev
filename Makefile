CFLAGS=-Wall -ggdb
TARGET=simple3
PREFIX=/usr/local

OUTDIR=out

.PHONY: all clean install uninstall

all: $(TARGET)

simple3: simple3.c print.h libPrint.so
	cc $(CFLAGS) simple3.c -I. -L. -lPrint -o $(TARGET) -ggdb -g

libPrint.so: print.c print.h
	cc $(CFLAGS) print.c -shared -fPIC -o libPrint.so -ggdb -g

clean: 
	rm -f $(TARGET) libPrint.so *.o 2>/dev/null

install:
	install $(TARGET) $(PREFIX)/bin
	install libPrint.so $(PREFIX)/lib

uninstall:
	rm -f $(PREFIX)/bin/$(TARGET)
	rm -f $(PREFIX)/lib/libPrint.so
