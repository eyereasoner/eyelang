correctedCodeword(packet1, [1, 0, 1, 1, 0, 1, 0]).
decodedPayload(packet1, [1, 0, 1, 0]).
errorBit(packet1, 5).
reason(packet1, "Hamming syndrome identifies the flipped bit position").
status(packet1, single_bit_corrected).
syndrome(packet1, 5).
