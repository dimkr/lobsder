CC ?= cc
CFLAGS ?= -Wall -pedantic
CFLAGS += -DHAVE_STDINT_H
LDFLAGS ?=
DESTDIR ?= /
PREFIX ?= /usr
LIB_DIR ?= $(PREFIX)/lib
INCLUDE_DIR ?= $(PREFIX)/include
DOC_DIR ?= $(PREFIX)/share/doc/liblobsder

all: liblobsder.a lobsder.pc

%.o: %.c
	$(CC) -c -o $@ $< $(CFLAGS)

liblobsder.a: arc4random.o
	ar rcs liblobsder.a $<

lobsder.pc:
	echo "prefix=$(PREFIX)" > lobsder.pc
	echo "exec_prefix=" >> lobsder.pc
	echo "libdir=$(LIB_DIR)" >> lobsder.pc
	echo "includedir=$(INCLUDE_DIR)" >> lobsder.pc
	echo "" >> lobsder.pc
	echo "Name: lobsder" >> lobsder.pc
	echo "Description: OpenBSD compatibility layer" >> lobsder.pc
	echo "Version: 0.1" >> lobsder.pc
	echo "Requires:" >> lobsder.pc
	echo 'Libs: -L$${libdir} -llobsder' >> lobsder.pc
	echo 'Cflags: -I$${includedir}/lobsder' >> lobsder.pc

clean:
	rm -f lobsder.pc liblobsder.a *.o

install: all
	install -v -D -m 644 liblobsder.a $(DESTDIR)/$(LIB_DIR)/liblobsder.a
	install -v -D -m 644 lobsder.pc $(DESTDIR)/$(LIB_DIR)/pkgconfig/lobsder.pc
	install -v -d -m 755 $(DESTDIR)/$(INCLUDE_DIR)
	cp -v -r include/lobsder $(DESTDIR)/$(INCLUDE_DIR)/
	install -v -D -m 644 README $(DESTDIR)/$(DOC_DIR)/README
	install -v -m 644 COPYING $(DESTDIR)/$(DOC_DIR)/COPYING
	install -v -m 644 COPYING.arc4random $(DESTDIR)/$(DOC_DIR)/COPYING.arc4random
