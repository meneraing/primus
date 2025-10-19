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
primus.o: primus.c config.h wlr-layer-shell-unstable-v1-protocol.h
	$(CC) -c $< -g -Werror $(CFLAGS) -I. -DWLR_USE_UNSTABLE -o $@

# wayland-scanner is a tool which generates C headers and rigging for Wayland
# protocols, which are specified in XML. wlroots requires you to rig these up
# to your build system yourself and provide them in the include path.
WAYLAND_SCANNER   = `$(PKG_CONFIG) --variable=wayland_scanner wayland-scanner`
WAYLAND_PROTOCOLS = `$(PKG_CONFIG) --variable=pkgdatadir wayland-protocols`

wlr-layer-shell-unstable-v1-protocol.h:
	$(WAYLAND_SCANNER) enum-header \
		protocols/wlr-layer-shell-unstable-v1.xml $@

config.h:
	cp config.def.h $@

clean:
	rm -f primus *.o *-protocol.h

.PHONY: all clean
