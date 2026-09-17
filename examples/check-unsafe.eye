# Source: eyeleng/examples/check-unsafe.srl (b7c7e46f8297).
knows(alice, bob).
# Like the source warning, ?someone is deliberately not bound by the body.
seen(?someone) if knows(alice, bob).
ask seen(?someone).
