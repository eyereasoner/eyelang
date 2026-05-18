CC ?= cc
VERSION := $(shell cat VERSION)
CFLAGS ?= -std=c11 -O2 -Wall -Wextra
CPPFLAGS ?= -DEYELOG_VERSION=\"$(VERSION)\"
BIN = bin/eyelog
all: $(BIN)
$(BIN): src/eyelog.c
	mkdir -p bin
	$(CC) $(CPPFLAGS) $(CFLAGS) -o $(BIN) src/eyelog.c
check test: all
	./test/run.sh
clean:
	rm -f $(BIN)
.PHONY: all check test clean
