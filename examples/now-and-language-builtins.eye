# Source: eyeleng/examples/now-and-language-builtins.srl (b7c7e46f8297).
text(msg, literal("bonjour", fr)).
same_language(?message) if text(?message, literal(?value, fr)).
# NOW is deliberately an explicit input in a deterministic logic program.
clock(snapshot(datetime(2026, 5, 15, 10, 20, 30))).
ask same_language(msg). ask clock(?snapshot).
