CC ?= cc
EMCC ?= emcc
VERSION := $(shell cat VERSION)
CFLAGS ?= -std=c11 -O2 -Wall -Wextra
CPPFLAGS ?= -DEYELOG_VERSION=\"$(VERSION)\"
LDLIBS ?= -lm
PYTHON ?= python3
BIN = bin/eyelog
BROWSER_DIR = dist/browser
BROWSER_JS = $(BROWSER_DIR)/eyelog.mjs
BROWSER_WASM = $(BROWSER_DIR)/eyelog.wasm
BROWSER_STACK_SIZE ?= 16777216
TEST_SUITES := $(filter-out test check,$(MAKECMDGOALS))

all: cli browser

cli: $(BIN)

$(BIN): src/eyelog.c VERSION Makefile
	mkdir -p bin
	$(CC) $(CPPFLAGS) $(CFLAGS) -o $(BIN) src/eyelog.c $(LDLIBS)

browser: $(BROWSER_JS)

$(BROWSER_JS): src/eyelog.c VERSION Makefile
	mkdir -p $(BROWSER_DIR)
	$(EMCC) $(CPPFLAGS) $(CFLAGS) -o $(BROWSER_JS) src/eyelog.c $(LDLIBS) \
		-sMODULARIZE=1 \
		-sEXPORT_ES6=1 \
		-sEXPORT_NAME=createEyelogModule \
		-sENVIRONMENT=web,worker \
		-sALLOW_MEMORY_GROWTH=1 \
		-sSTACK_SIZE=$(BROWSER_STACK_SIZE) \
		-sSTACK_OVERFLOW_CHECK=1 \
		-sFORCE_FILESYSTEM=1 \
		-sEXIT_RUNTIME=0 \
		-sEXPORTED_RUNTIME_METHODS='["FS","callMain"]'

rebuild: clean all

check test: clean cli
	./test/run.sh $(TEST_ARGS) $(TEST_SUITES)

api examples conformance core extension:
	@if [ -z "$(filter test check,$(MAKECMDGOALS))" ]; then \
		echo "Use: make test $@"; \
		exit 2; \
	fi

serve: browser
	$(PYTHON) -m http.server 8000

clean:
	rm -f $(BIN) $(BROWSER_JS) $(BROWSER_WASM)

.PHONY: all cli browser serve check test rebuild clean api examples conformance core extension
