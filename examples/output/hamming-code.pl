triple(packet1, correctedCodeword, [1, 0, 1, 1, 0, 1, 0]).
triple(packet1, decodedPayload, [1, 0, 1, 0]).
triple(packet1, errorBit, 5).
triple(packet1, reason, "Hamming syndrome identifies the flipped bit position").
triple(packet1, status, single_bit_corrected).
triple(packet1, syndrome, 5).
