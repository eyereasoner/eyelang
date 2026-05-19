CC ?= cc
VERSION := $(shell cat VERSION)
CFLAGS ?= -std=c11 -O2 -Wall -Wextra
CPPFLAGS ?= -DEYELOG_VERSION=\"$(VERSION)\"
LDLIBS ?= -lm
BIN = bin/eyelog
all: $(BIN)
$(BIN): src/eyelog.c VERSION
	mkdir -p bin
	$(CC) $(CPPFLAGS) $(CFLAGS) -o $(BIN) src/eyelog.c $(LDLIBS)
rebuild: clean all
check test: rebuild
	./test/run.sh
clean:
	rm -f $(BIN)
.PHONY: all check test rebuild clean
