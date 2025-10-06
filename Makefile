export PKG_CONFIG_PATH := /usr/local/lib/pkgconfig
export LD_LIBRARY_PATH := /usr/local/lib

PKG_CONFIG?=pkg-config

PKGS="wlroots-0.20" wayland-server xkbcommon
CFLAGS_PKG_CONFIG!=$(PKG_CONFIG) --cflags $(PKGS)
CFLAGS+=$(CFLAGS_PKG_CONFIG)
LIBS!=$(PKG_CONFIG) --libs $(PKGS)

all: primus

primus: primus.o
	$(CC) $^ $> -g -Werror $(CFLAGS) $(LDFLAGS) $(LIBS) -o $@
primus.o: primus.c config.h
	$(CC) -c $< -g -Werror $(CFLAGS) -I. -DWLR_USE_UNSTABLE -o $@

config.h:
	cp config.def.h $@

clean:
	rm -f primus primus.o

.PHONY: all clean
